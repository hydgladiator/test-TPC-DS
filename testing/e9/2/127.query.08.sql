-- start query 27 in stream 1 using template query8.tpl
select  s_store_name
      ,sum(ss_net_profit)
 from store_sales
     ,date_dim
     ,store,
     (select ca_zip
     from (
     (SELECT substr(ca_zip,1,5) ca_zip
      FROM customer_address
      WHERE substr(ca_zip,1,5) IN (
                          '41642','44093','63394','22949','64276','59891',
                          '95097','40954','99911','16314','54489',
                          '19514','21071','94047','48885','25364',
                          '78120','29175','87704','37810','20893',
                          '64691','65893','28639','38679','60537',
                          '97394','44337','99977','50744','67235',
                          '73776','71044','61710','44376','58627',
                          '66628','93999','97073','37478','54312',
                          '47573','74840','84067','68365','69513',
                          '30232','40773','75302','42976','48297',
                          '18856','73743','73581','56290','62337',
                          '44863','60740','73218','45252','15353',
                          '34274','46616','60144','83004','89158',
                          '65504','84100','95690','25586','39934',
                          '35107','33501','51401','95504','22286',
                          '27734','14560','71096','17023','94158',
                          '58127','34837','49668','87496','71097',
                          '80000','85492','33259','47000','32550',
                          '62574','41422','78719','16034','43065',
                          '32436','83935','97514','49551','73904',
                          '57250','41288','38714','89172','57604',
                          '70219','40142','80913','92813','55819',
                          '35673','68598','12288','29541','81747',
                          '76044','55404','18276','46101','38183',
                          '80666','28329','64443','55340','23607',
                          '54395','42960','40288','25045','12575',
                          '64609','55820','28649','34313','47163',
                          '21218','62871','83438','15438','89719',
                          '28967','32559','48461','47561','19307',
                          '16664','35854','59689','27416','33791',
                          '29278','79098','15191','83745','94210',
                          '68870','34290','57946','64514','38920',
                          '41135','60601','86383','95536','55836',
                          '88848','93244','62613','88001','74894',
                          '39157','32674','81255','69176','80844',
                          '44110','43767','72181','11940','86479',
                          '90050','10276','64106','95067','10177',
                          '67128','74214','23107','93513','85574',
                          '55726','48713','84778','96823','50354',
                          '33996','30391','92887','35941','46394',
                          '67035','66481','74671','28081','89122',
                          '66822','67841','46783','82200','57530',
                          '61906','31814','44114','70749','40847',
                          '54800','56691','45860','20674','57363',
                          '15566','24994','82874','65496','24392',
                          '16294','49353','88764','43337','15512',
                          '30342','50801','41339','72478','27766',
                          '83737','13715','58460','20271','89483',
                          '14708','25346','56674','43312','34534',
                          '65909','45632','55629','57628','84699',
                          '59667','56341','34228','11285','61991',
                          '79346','58450','51287','14134','31271',
                          '22955','86106','63114','66316','35168',
                          '41603','80832','52593','48566','96381',
                          '29701','20389','60467','42031','62824',
                          '57213','37484','60683','69455','84493',
                          '90992','50575','74069','30140','93402',
                          '12431','40322','11622','99940','98253',
                          '56353','76514','59031','84304','81609',
                          '92572','78678','49785','80179','63659',
                          '90202','40454','18756','51834','47888',
                          '42897','42464','65402','70274','67518',
                          '11373','99964','43974','23885','74173',
                          '22693','81830','25311','40396','57071',
                          '34444','24907','85417','80720','65548',
                          '25963','69339','50103','93086','58693',
                          '77486','17353','79934','52704','26021',
                          '40588','93890','52513','69500','48197',
                          '22514','80264','46984','14305','22714',
                          '31744','46236','75868','79964','16810',
                          '64179','58277','10402','55779','82370',
                          '32751','45445','96685','49722','63098',
                          '81433','73809','44475','43748','54337',
                          '12314','44260','23149','43094','97311',
                          '30429','47979','81620','92785','71234',
                          '37805','11941','78902','81812','50440',
                          '47780','55810','76321','68879','83799',
                          '26087','39010','69986','92677','35984',
                          '38615','29171','55633','13121','34476',
                          '65004','46824','76430','29577'))
     intersect
     (select ca_zip
      from (SELECT substr(ca_zip,1,5) ca_zip,count(*) cnt
            FROM customer_address, customer
            WHERE ca_address_sk = c_current_addr_sk and
                  c_preferred_cust_flag='Y'
            group by ca_zip
            having count(*) > 10)A1))A2) V1
 where ss_store_sk = s_store_sk
  and ss_sold_date_sk = d_date_sk
  and d_qoy = 1 and d_year = 2002
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

-- end query 27 in stream 1 using template query8.tpl
