Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E4663C
	for <regressions@lists.linux.dev>; Mon, 23 Dec 2024 09:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734944438; cv=none; b=Lo2pkBfC2NxgHgx9y3GBTp0G0LoCwr0xYIXZUbwjmXyPCuuwwHdCiChrbxdZppx0zY7cOawVZnuqxaY5HUciR82acfh6Zds3ydWfMmmYGU5JI4Q8UnyH4S4PLJdwWBsw8U+QVZWmkCqdWSLojxX4MdqbnTK+tx4fUO9Wnbg5M10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734944438; c=relaxed/simple;
	bh=apyhCkR287niL3d1YSrr5GRuLr/eMGYqCRcXMCyQTUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d+3nAM7IJC0m8Q52b+K5dXthonOs6tOqOT7ph5557Undr87cyVlDjrcE/avfEtqCAs9sdyyj6J5tpoBsOQE9P4AlGl9WlkpOpPIPgvTPWY7PuFtdJBzFdxjGA0O0sjFY9QhfceUTZcW1ePG3orsNO1Iuip32RYbRAZvWf5zzvSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 5cceec60c10c11efa216b1d71e6e1362-20241223
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:1f166ce3-27bc-402a-9223-73f7bf98c3b8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-9
X-CID-INFO: VERSION:1.1.41,REQID:1f166ce3-27bc-402a-9223-73f7bf98c3b8,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:-9
X-CID-META: VersionHash:6dc6a47,CLOUDID:69e0115593e5ce402bd46120ef31f18b,BulkI
	D:241223111037IFXEDWP6,BulkQuantity:1,Recheck:0,SF:17|19|24|38|45|64|66|78
	|80|81|82|83|102|841,TC:nil,Content:0,EDM:-3,IP:1,URL:1,File:nil,RT:nil,Bu
	lk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0
	,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,
	TF_CID_SPAM_IBB,TF_CID_SPAM_ULS
X-UUID: 5cceec60c10c11efa216b1d71e6e1362-20241223
X-User: zhaomengmeng@kylinos.cn
Received: from [192.168.109.86] [(123.150.8.42)] by mailgw.kylinos.cn
	(envelope-from <zhaomengmeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 910367675; Mon, 23 Dec 2024 17:00:31 +0800
Message-ID: <f6362e58-3d7d-4949-82bd-28e5f284a258@kylinos.cn>
Date: Mon, 23 Dec 2024 17:00:27 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug#1089698: linux: Loop-mounted UDF ISOs no longer readable
To: Daniel Reichelt <debian@nachtgeist.net>,
 Salvatore Bonaccorso <carnil@debian.org>, jack@suse.cz
Cc: 1089698@bugs.debian.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <173392552823.2176723.16461319920125128905.reportbug@enterprise.startrek.nachtgeist.net>
 <Z17iMjM5jqc0o3uu@eldamar.lan>
 <173392552823.2176723.16461319920125128905.reportbug@enterprise.startrek.nachtgeist.net>
 <d1ed7b71-b6a4-4feb-9126-c05bdd7db7d1@nachtgeist.net>
 <Z2XLm0XdGof_nNIt@eldamar.lan>
 <befd89c7-474f-4713-a2b0-6bcc1f2461b0@nachtgeist.net>
From: Zhao Mengmeng <zhaomengmeng@kylinos.cn>
In-Reply-To: <befd89c7-474f-4713-a2b0-6bcc1f2461b0@nachtgeist.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2024/12/23 11:10, Daniel Reichelt wrote:
> On 20.12.24 20:55, Salvatore Bonaccorso wrote:
>> Additionally I have now reported the issue on the regressions list as
>> well:
>>
>> https://lore.kernel.org/regressions/Z2XKY0f6on1UbwWb@eldamar.lan/T/#u
> 
> Splendid, thanks!
> 
> 
> Quick update: 6.2 is also OK, so we have:
> 
> OK still:
>   6.1.112-1
> UNKNOWN - not in [1], yet to be bisected/compiled
>   6.1.113
>   6.1.114
> BAD:
>   6.1.115-1
>   6.1.119-1
>   6.1.120 not part of [1], but out-of-tree build was bad
> OK again:
>   6.2 (upstream vanilla)
>   6.3.1-1~exp1
>   6.11.10 (current Debian testing/Trixie)
>   6.12.5  (current Debian unstable/sid)
> 
> 
> [1] https://snapshot.debian.org/package/linux/

Hi Jan, I have tested v6.1 upstream kernel with x86_64_defconfig, it turns out:

v6.1.112 is good as Daniel reported,
v6.1.114 is bad, but the log is little different.
                                              
[   21.307158] UDF-fs: error (device sr0): udf_fiiter_advance_blk: extent after position 12280 not allocated in directory (ino 312)                                                           
[   21.307832] UDF-fs: error (device sr0): udf_verify_fi: directory (ino 312) has entry where CRC length (2) does not match entry length (24)                                                 
[   21.308738] UDF-fs: error (device sr0): udf_fiiter_advance_blk: extent after position 12280 not allocated in directory (ino 312)                                                           
[   21.309785] UDF-fs: error (device sr0): udf_verify_fi: directory (ino 312) has entry where CRC length (2) does not match entry length (24)                                                 
[   21.310996] UDF-fs: error (device sr0): udf_fiiter_advance_blk: extent after position 12280 not allocated in directory (ino 312)          

I also manually revert my patch "udf: refactor udf_current_aext() to handle error" based on v6.1.115, and
it's still broken, looks like something wrong in v6.1.114. Can you have a look? 

Besides, I noticed that v6.1 LTS backports only 1 of 3 of the refactor patches wich I submitted, that may be a problem.


> 
> Thanks to y'all!
> Daniel

