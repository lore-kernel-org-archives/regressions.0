Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D863533F7
	for <regressions@lists.linux.dev>; Wed, 25 Dec 2024 01:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735088789; cv=none; b=XNMjhYZQFj4L3J9I9eM2lE6l+haRx+BpjX8iw33NTpfi/+YwaK1ziAIT/5deUN/YT8boMl3kdkt9Q0H5CBg1CrQzfdAO7ThWRyBjfiGcuC9p0F7Owz1qjk6J5hglxWDF12+Hy57OfYFx2t5N7XAOeAA69KJQLWmmdhB0+BEIRLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735088789; c=relaxed/simple;
	bh=VzUH7TCKqKcoVM0Tkot4m/WV31TKhBWqdoaBuKrCcgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ox/ugBQw8RDvUbFLbL+JvPN+7xhKAR8ld7I7eU160uudKc1mzBPLR+n4/e0TPo+7+Hx3rBi0mLCECdiORtSaxRxHCsyRG7OotuOpJQf4k0mLSOBKe60YXi6LDXPG/9XYHfjNyspYeEh3t3gb1LH93CXhX/00OYSJzAwxD32rKwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 70e25010c25c11efa216b1d71e6e1362-20241225
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:76a6653b-a484-4bd2-aa90-265b7098f9d5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-9
X-CID-INFO: VERSION:1.1.41,REQID:76a6653b-a484-4bd2-aa90-265b7098f9d5,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:-9
X-CID-META: VersionHash:6dc6a47,CLOUDID:46ab343add43b4608a396c6f891a3e41,BulkI
	D:2412230845101WTR1OVF,BulkQuantity:6,Recheck:0,SF:17|19|24|43|64|66|74|78
	|80|81|82|83|102|841,TC:nil,Content:0,EDM:-3,IP:1,URL:1,File:nil,RT:nil,Bu
	lk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0
	,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,
	TF_CID_SPAM_IBB,TF_CID_SPAM_ULS
X-UUID: 70e25010c25c11efa216b1d71e6e1362-20241225
X-User: zhaomengmeng@kylinos.cn
Received: from [192.168.109.86] [(123.150.8.42)] by mailgw.kylinos.cn
	(envelope-from <zhaomengmeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1090107959; Wed, 25 Dec 2024 09:06:15 +0800
Message-ID: <18e96492-af22-4bfe-8005-5114a4d5d99e@kylinos.cn>
Date: Wed, 25 Dec 2024 09:06:11 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression] linux: Loop-mounted UDF ISOs no longer readable
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jan Kara <jack@suse.cz>, sashal@kernel.org,
 Salvatore Bonaccorso <carnil@debian.org>,
 Daniel Reichelt <debian@nachtgeist.net>, linux-kernel@vger.kernel.org,
 1089698@bugs.debian.org, regressions@lists.linux.dev
References: <Z2XKY0f6on1UbwWb@eldamar.lan>
 <b681e1ea-bb7d-4d8f-b62c-cae1e4116d21@kylinos.cn>
 <6c8e6c68-b0a1-47b4-82a4-c68490fdc876@kylinos.cn>
 <2024122420-litter-cadillac-53cd@gregkh>
From: Zhao Mengmeng <zhaomengmeng@kylinos.cn>
In-Reply-To: <2024122420-litter-cadillac-53cd@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024/12/24 17:59, Greg KH wrote:
> On Tue, Dec 24, 2024 at 05:46:59PM +0800, Zhao Mengmeng wrote:
>> On 2024/12/23 10:48, Zhao Mengmeng wrote:
>>> On 2024/12/21 03:49, Salvatore Bonaccorso wrote:
>>>> Hi Jan, hi Zhao,
>>>>
>>>> In Debian we got he following report, full quoted below from Daniel
>>>> Reichelt, dass after updating to 6.1.115 (and later, confirmed up to
>>>> 6.1.119), loop-mounted UDF ISOs are no longer readable:
>>>
>>> Sorry to hear that...
>>>
>>>>> Hi,
>>>>>
>>>>> in 6.1.112-1 I could loop-mount Windows Setup ISOs (downloaded from M$; hashes
>>>>> are fine; 10/11, DE/EN don't seem to make any difference) and access their
>>>>> content perfectly fine, i.e. share the /sources/ sub-directory via samba for
>>>>> netinstall scenarios.
>>>>>
>>>>> Starting with 6.1.115-1, the ISOs can be mounted, the root-dir is accessible
>>>>> and `stat $mntpt/sources` gives output as well. However `ls $mntpt/sources`
>>>>> hangs and the kernel log is spammed with entries like
>>>>>
>>>>> ---------------8<-------------------------
>>>>> 2024-12-11T14:53:19.616728+01:00 srv kernel: [182394.024828] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
>>>>> 2024-12-11T14:53:19.629970+01:00 srv kernel: [182394.038041] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
>>>>> 2024-12-11T14:53:19.641623+01:00 srv kernel: [182394.049714] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
>>>>> 2024-12-11T14:53:19.654841+01:00 srv kernel: [182394.062928] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
>>>>> 2024-12-11T14:53:19.666495+01:00 srv kernel: [182394.074615] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
>>>>> 2024-12-11T14:53:19.679747+01:00 srv kernel: [182394.087833] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
>>>>> 2024-12-11T14:53:19.691394+01:00 srv kernel: [182394.099510] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
>>>>> 2024-12-11T14:53:19.704646+01:00 srv kernel: [182394.112727] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
>>>>> 2024-12-11T14:53:19.716283+01:00 srv kernel: [182394.124400] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
>>>>> 2024-12-11T14:53:19.729539+01:00 srv kernel: [182394.137618] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
>>>>> 2024-12-11T14:53:19.741185+01:00 srv kernel: [182394.149279] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
>>>>> 2024-12-11T14:53:19.754422+01:00 srv kernel: [182394.162494] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
>>>>> 2024-12-11T14:53:19.766071+01:00 srv kernel: [182394.174159] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
>>>>> 2024-12-11T14:53:19.779289+01:00 srv kernel: [182394.187375] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
>>>>> ---------------8<-------------------------
>>>>>
>>>>>
>>>>> 6.1.119-1 shows the same behaviour.
>>>>> Let me know if you need additional info.
>>>>
>>>> We have not a full bisect, but Daniel confirmed already in
>>>> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1089698#22 some
>>>> observations:
>>>>
>>>>> OK:
>>>>>   6.1.112-1
>>>>> BAD:
>>>>>   6.1.115-1
>>>>>   6.1.119-1
>>>>> OK again:
>>>>>   6.3.1-1~exp1
>>>>>   current trixie
>>>>>   current sid
>>>>
>>>> (current trixie is 6.11.10 based kernel, current sid is based on
>>>> 6.12.5 kernel).
>>>>
>>>> Dies this ring some bell to you?
>>>
>>> I'll take a look at it. Will post it here if anything new founded.
>>>
>>>> #regzbot introduced: v6.1.112..v6.1.115
>>>> #regzbot monitor: https://bugs.debian.org/1089698
>>>>
>>>> Regards,
>>>> Salvatore
>>>
>> --------------------
>> Update on 2024.12.24:
>>
>> Hi Jan, Sasha, after some testing and code digging, I found that v6.1 LTS may need 
>> this patch to solve Daniel's issue:
>>
>> commit 1ea1cd11c72d1405a6b98440a9d5ea82dfa07166
>> Author: Jan Kara <jack@suse.cz>
>> Date:   Wed Jan 25 11:43:03 2023 +0100
>>
>>     udf: Fix directory iteration for longer tail extents
>>     
>>     When directory's last extent has more that one block and its length is
>>     not multiple of a block side, the code wrongly decided to move to the
>>     next extent instead of processing the last partial block. This led to
>>     directory corruption. Fix the rounding issue.
>>     
>>     Signed-off-by: Jan Kara <jack@suse.cz>
> 
> It's already queued up for the next 6.1.y release in a few days, so if
> you could test the -rc that is out for review right now, that would be
> great!

Glad to test it, will do.

> thanks,
> 
> greg k-h

