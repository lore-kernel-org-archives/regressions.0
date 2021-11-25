Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04E12C80
	for <regressions@lists.linux.dev>; Thu, 25 Nov 2021 17:01:04 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1APGNt6J001612
	for <regressions@lists.linux.dev>; Thu, 25 Nov 2021 17:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=gXhujkqvzyApA+TZdeJlBEk/zRoEAaU7Pa55t4qeM3s=;
 b=TUMnQxccHg2RkluQ1b+4eQ/kaYPGLo/BAkzX7yVVdFwzzHvARL76e2tfztZ4IPt97Sml
 wMDRX4MKYX6lRU1pIX74me4j0meyxg7HK2MQo8g0uWcGrEHZyfHqfh1UiGzvW+gZjCtY
 ca8L0Tz2TqQ6OZf8DjMCQI/3MrEODvndaB54txSOOYOiii84a4SOH3nEekxVerAl179Q
 8ehNugnXiMUU7mD972Mv0mUyQNK9xhPEC9uif879dm69/AMRmCk6KxeSA8/TfpQcYeYW
 k7cIvzcaL1z0c4R6sUBwaArKJ7/dCIpX6BaMcUGCJXwe8TFtP4MLDkk4Qg26KUjsmI3A Kg== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0b-001b2d01.pphosted.com with ESMTP id 3cjb874ax0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <regressions@lists.linux.dev>; Thu, 25 Nov 2021 17:00:57 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1APGqjOO006716
	for <regressions@lists.linux.dev>; Thu, 25 Nov 2021 17:00:40 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma01fra.de.ibm.com with ESMTP id 3cerna30m4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <regressions@lists.linux.dev>; Thu, 25 Nov 2021 17:00:39 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 1APH0b7o33423782
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <regressions@lists.linux.dev>; Thu, 25 Nov 2021 17:00:37 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 65D5111C054
	for <regressions@lists.linux.dev>; Thu, 25 Nov 2021 17:00:37 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 481D911C06C
	for <regressions@lists.linux.dev>; Thu, 25 Nov 2021 17:00:37 +0000 (GMT)
Received: from [9.145.37.211] (unknown [9.145.37.211])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP
	for <regressions@lists.linux.dev>; Thu, 25 Nov 2021 17:00:37 +0000 (GMT)
Message-ID: <c68b8cb6-ff71-c7e8-8ff7-4126dd8cdc0a@linux.ibm.com>
Date: Thu, 25 Nov 2021 18:00:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Missing driver-specific sysfs attributes of scsi_device [was: Re:
 [PATCH v4 00/46] Register SCSI sysfs attributes earlier]
Content-Language: en-US
From: Steffen Maier <maier@linux.ibm.com>
To: regressions@lists.linux.dev
References: <20211012233558.4066756-1-bvanassche@acm.org>
 <163478764102.7011.9375895285870786953.b4-ty@oracle.com>
 <7c0af228-e098-5657-934e-d2bd2bff5ee3@linux.ibm.com>
In-Reply-To: <7c0af228-e098-5657-934e-d2bd2bff5ee3@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PnJl3kLpwgBWEKc7PqsfWOg78REGso-h
X-Proofpoint-ORIG-GUID: PnJl3kLpwgBWEKc7PqsfWOg78REGso-h
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-25_06,2021-11-25_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1011
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111250093

On 10/23/21 22:54, Steffen Maier wrote:
> Hi Bart, hi Martin,
> 
> since Friday 2021-10-22 our CI reports errors with linux-next. It complains 
> about missing zfcp-lun resources (although that's a follow-on error). Machines 
> that have their root-fs on zfcp-attached SCSI disk(s) are stuck in boot. 
> Looking at user visible effects, I see zfcp-specific sysfs attributes of 
> scsi_device missing:
> 
> $ lszfcp -D
> /usr/sbin/lszfcp: line 390: 
> /sys/bus/ccw/drivers/zfcp/0.0.1780/host0/rport-0:0-0/target0:0:0/0:0:0:1089224725//hba_id: 
> No such file or directory
> /usr/sbin/lszfcp: line 391: 
> /sys/bus/ccw/drivers/zfcp/0.0.1780/host0/rport-0:0-0/target0:0:0/0:0:0:1089224725//wwpn: 
> No such file or directory
> /usr/sbin/lszfcp: line 392: 
> /sys/bus/ccw/drivers/zfcp/0.0.1780/host0/rport-0:0-0/target0:0:0/0:0:0:1089224725//fcp_lun: 
> No such file or directory
> 
> That made me think of this patch series. It also happened so that Martin 
> applied the series to 5.16/scsi-queue on 2021-10-21. Linux-next merged it on 
> 2021-10-22:
> 
> Merging scsi-mkp/for-next (83c3a7beaef7 scsi: lpfc: Update lpfc version to 
> 14.0.0.3)
> $ git merge -m Merge branch 'for-next' of 
> git://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git scsi-mkp/for-next
> ...
> + drivers/s390/scsi/zfcp_ext.h                    |   4 +-
> + drivers/s390/scsi/zfcp_fsf.c                    |   2 +-
> + drivers/s390/scsi/zfcp_scsi.c                   |   8 +-
> + drivers/s390/scsi/zfcp_sysfs.c                  |  52 ++--
> [https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20211022&id=cf6c9d12750cf6f3f6aeffcd0bdb36b1ac993f44] 
> 
> 
> So this seems to match with the occurrence of problems for us.
> 
> I wonder if any of the other LLDDs see similar problems. I left those LLDD 
> patches in the list below, that also were migrated from sdev_attrs to sdev_groups.
> 
> Guess it would be good to fix this before the v5.16 merge window opens 
> (2021-11-08 after predicted v5.15 release? [http://phb-crystal-ball.org/]) so 
> the error does not land in Linus' tree (which our CI also tests).
> 
> Not sure if I'll find time to dig deeper.

Didn't know about regzbot, so I'm trying to feed it after the facts.

#regzbot ^introduced: 92c4b58b15c56298b1b225c1d2e533165b3e32af
#regzbot fixed-by: 3a71f0f7a51259b3cb95d79cac1e19dcc5e89ce9
#regzbot monitor: 
https://lore.kernel.org/r/f5900f54-dddd-6dd4-ce13-a8bdfa58b6ad@linux.ibm.com
#regzbot link: 
https://lore.kernel.org/r/d9405d786496756564b31540cc73a9d22cc97730.camel@HansenPartnership.com
#regzbot monitor: 
https://lore.kernel.org/r/4b3e8a72-0b48-95e3-6617-a685d42c08fb@opensource.wdc.com
#regzbot monitor: 
https://lore.kernel.org/r/20211111084551.446548-1-damien.lemoal@opensource.wdc.com
#regzbot activity-ignore

> On 10/21/21 05:42, Martin K. Petersen wrote:
>> On Tue, 12 Oct 2021 16:35:12 -0700, Bart Van Assche wrote:
>>
>>> For certain user space software, e.g. udev, it is important that sysfs
>>> attributes are registered before the KOBJ_ADD uevent is emitted. Hence
>>> this patch series that removes the device_create_file() and
>>> sysfs_create_groups() calls from the SCSI core. Please consider this
>>> patch series for kernel v5.16.
>>>
>>> Thanks,
>>>
>>> [...]
>>
>> Applied to 5.16/scsi-queue, thanks!
>>
>> [01/46] scsi: core: Register sysfs attributes earlier
>>          https://git.kernel.org/mkp/scsi/c/92c4b58b15c5
>> [02/46] ata: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/c3f69c7f629f
>> [03/46] firewire: sbp2: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/5e88e67b6f3b
> 
>> [06/46] scsi: zfcp: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/d8d7cf3f7d07
> 
>> [10/46] scsi: 53c700: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/90cb6538b5da
>> [11/46] scsi: aacraid: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/bd16d71185c8
> 
>> [18/46] scsi: cxlflash: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/780c678912fb
> 
>> [21/46] scsi: hpsa: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/4cd16323b523
> 
>> [25/46] scsi: ipr: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/47d1e6ae0e1e
> 
>> [28/46] scsi: megaraid: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/09723bb252ca
>> [29/46] scsi: mpt3sas: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/1bb3ca27d2ca
> 
>> [31/46] scsi: myrb: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/582c0360db90
>> [32/46] scsi: myrs: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/087c3ace6337
> 
>> [42/46] scsi: smartpqi: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/64fc9015fbeb
> 
>> [45/46] scsi: usb: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/01e570febaaa
>> [46/46] scsi: core: Remove two host template members that are no longer used
>>          https://git.kernel.org/mkp/scsi/c/a47c6b713e89
> 
> 
> 


-- 
Mit freundlichen Gruessen / Kind regards
Steffen Maier

Linux on IBM Z and LinuxONE

https://www.ibm.com/privacy/us/en/
IBM Deutschland Research & Development GmbH
Vorsitzender des Aufsichtsrats: Gregor Pillen
Geschaeftsfuehrung: Dirk Wittkopp
Sitz der Gesellschaft: Boeblingen
Registergericht: Amtsgericht Stuttgart, HRB 243294
