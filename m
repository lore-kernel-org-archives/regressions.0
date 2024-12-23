Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA73D184E
	for <regressions@lists.linux.dev>; Mon, 23 Dec 2024 02:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734922151; cv=none; b=OPlIPjjYEZJZwlgiujlqfeSbAW/oi6RYzxnjlLLKlK1y4h9cif+INIusU0L+mJL3tXVEWrD2Yl38ePE0ymThCyH5f2j1cu20qx41Mh6cW4A6REtZpJ61u0YpxHAa+/UKqCBexUJtGuLdaahPHudYNpOZsTfiWiCjdtq7p3GFZ1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734922151; c=relaxed/simple;
	bh=+NrtkwIA9OsiBF2y3aquEI9tINZIwBeeXLhS1259jbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L+PWnZ7teMpontqyyfaUCg6FHRVpYCkLxbeki+lkhnfR5lE8vUbPW8NFic/3MyNHychmBDSbddOW+7kDIDSgagpnvVdgyJnzr4uVq5x9Ek62sA1FUV1uHqw7MOFFcHYzFLbeTx1fX/NrgwFEanNdFGB6TiWw/3VB+wOa8phb3Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 73d84b06c0d811efa216b1d71e6e1362-20241223
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:6d23d121-90fa-4460-b181-7ab5c16ad8ba,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:1
X-CID-INFO: VERSION:1.1.41,REQID:6d23d121-90fa-4460-b181-7ab5c16ad8ba,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:1
X-CID-META: VersionHash:6dc6a47,CLOUDID:962b207b46f931a84940071bd85433b2,BulkI
	D:2412230845101WTR1OVF,BulkQuantity:1,Recheck:0,SF:17|19|24|38|45|64|66|78
	|80|81|82|83|102|841,TC:nil,Content:0,EDM:-3,IP:1,URL:1,File:nil,RT:nil,Bu
	lk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0
	,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,
	TF_CID_SPAM_IBB,TF_CID_SPAM_ULS
X-UUID: 73d84b06c0d811efa216b1d71e6e1362-20241223
X-User: zhaomengmeng@kylinos.cn
Received: from [192.168.109.86] [(123.150.8.42)] by mailgw.kylinos.cn
	(envelope-from <zhaomengmeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 166686539; Mon, 23 Dec 2024 10:48:56 +0800
Message-ID: <b681e1ea-bb7d-4d8f-b62c-cae1e4116d21@kylinos.cn>
Date: Mon, 23 Dec 2024 10:48:52 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression] linux: Loop-mounted UDF ISOs no longer readable
To: Salvatore Bonaccorso <carnil@debian.org>, regressions@lists.linux.dev,
 Jan Kara <jack@suse.cz>
Cc: Daniel Reichelt <debian@nachtgeist.net>, linux-kernel@vger.kernel.org
References: <Z2XKY0f6on1UbwWb@eldamar.lan>
From: Zhao Mengmeng <zhaomengmeng@kylinos.cn>
In-Reply-To: <Z2XKY0f6on1UbwWb@eldamar.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024/12/21 03:49, Salvatore Bonaccorso wrote:
> Hi Jan, hi Zhao,
> 
> In Debian we got he following report, full quoted below from Daniel
> Reichelt, dass after updating to 6.1.115 (and later, confirmed up to
> 6.1.119), loop-mounted UDF ISOs are no longer readable:

Sorry to hear that...

>> Hi,
>>
>> in 6.1.112-1 I could loop-mount Windows Setup ISOs (downloaded from M$; hashes
>> are fine; 10/11, DE/EN don't seem to make any difference) and access their
>> content perfectly fine, i.e. share the /sources/ sub-directory via samba for
>> netinstall scenarios.
>>
>> Starting with 6.1.115-1, the ISOs can be mounted, the root-dir is accessible
>> and `stat $mntpt/sources` gives output as well. However `ls $mntpt/sources`
>> hangs and the kernel log is spammed with entries like
>>
>> ---------------8<-------------------------
>> 2024-12-11T14:53:19.616728+01:00 srv kernel: [182394.024828] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
>> 2024-12-11T14:53:19.629970+01:00 srv kernel: [182394.038041] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
>> 2024-12-11T14:53:19.641623+01:00 srv kernel: [182394.049714] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
>> 2024-12-11T14:53:19.654841+01:00 srv kernel: [182394.062928] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
>> 2024-12-11T14:53:19.666495+01:00 srv kernel: [182394.074615] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
>> 2024-12-11T14:53:19.679747+01:00 srv kernel: [182394.087833] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
>> 2024-12-11T14:53:19.691394+01:00 srv kernel: [182394.099510] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
>> 2024-12-11T14:53:19.704646+01:00 srv kernel: [182394.112727] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
>> 2024-12-11T14:53:19.716283+01:00 srv kernel: [182394.124400] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
>> 2024-12-11T14:53:19.729539+01:00 srv kernel: [182394.137618] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
>> 2024-12-11T14:53:19.741185+01:00 srv kernel: [182394.149279] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
>> 2024-12-11T14:53:19.754422+01:00 srv kernel: [182394.162494] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
>> 2024-12-11T14:53:19.766071+01:00 srv kernel: [182394.174159] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
>> 2024-12-11T14:53:19.779289+01:00 srv kernel: [182394.187375] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
>> ---------------8<-------------------------
>>
>>
>> 6.1.119-1 shows the same behaviour.
>> Let me know if you need additional info.
> 
> We have not a full bisect, but Daniel confirmed already in
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1089698#22 some
> observations:
> 
>> OK:
>>   6.1.112-1
>> BAD:
>>   6.1.115-1
>>   6.1.119-1
>> OK again:
>>   6.3.1-1~exp1
>>   current trixie
>>   current sid
> 
> (current trixie is 6.11.10 based kernel, current sid is based on
> 6.12.5 kernel).
> 
> Dies this ring some bell to you?

I'll take a look at it. Will post it here if anything new founded.

> #regzbot introduced: v6.1.112..v6.1.115
> #regzbot monitor: https://bugs.debian.org/1089698
> 
> Regards,
> Salvatore

