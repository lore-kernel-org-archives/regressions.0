Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA731FA1
	for <regressions@lists.linux.dev>; Fri,  3 Mar 2023 08:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1677831203; x=1709367203;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4WOsAfpITDveUkLlKm0C8SxMPp9Wv2/hWv9cOYmED8c=;
  b=YxyCK1MEHFc7aYK1aI2kUIt5ETwt1DHzMSLWrNjI1nwM9+oYy8FpiDZc
   YlQeKKaTKdMGQ21mDJBP3781glXB4dOeJ2njuyCXEx7ePJS9OJTxQJQnK
   2lq/ynZF2d7+GCJOgI5ler3Q9qHvS6LcWrmQwUaWyrep9b6HaW4OHipcB
   zJv/fCZ7wG7u9LLDHuTV6ihZxXa7V3+s+jdFYusBf8S39cTmhAjXTCfY/
   WrUBeyjHGSDuT8chylpBaVE+QYkUunBjUyyFgv0pWHmobPEaU4ay7qZWZ
   pkyFg2Wl1eNWp3Q/vM7fMZugfWzH0HD6NnPdYVVIHjV35y17WlO50f+gD
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,230,1673884800"; 
   d="scan'208";a="329039614"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2023 16:12:13 +0800
IronPort-SDR: HGNms6Dqj117ucZn42hF/W2pPDmXwkZvICaDu2V8ImisxwglrZrAHSlGFnSh0lXra+SCnPWinl
 +cCpGjZDFwRH899NEmqN7qvN4xF7ECH7askKDwKtvdkqBafhiz4+yeDPhP+Gx0Y3ZeA4xiI66M
 TPq19unKM8wvjACKZ6xih0hkDKV0+MtXd2xrLHjQk9/rKg+wEKdVP+kcBOpBw3a3a/WPnwJQaB
 6q1f52QVT1aaPQI4bK8BpcLstI/XQyO6loshSsyUVNmbeXRsh0A5WM6mLHwlL0tI3J9ZScvHHp
 s9o=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Mar 2023 23:29:01 -0800
IronPort-SDR: CYOdEhGOCqouX9glzCedsH2QhMO1yhhSme9Czb+5YHOWJG9t0O3uIogiBFNHF7mtPNXo/uzBci
 g5HYD8UBJqcvYMc+sNAD8lhSfXjhIzOnYR5y9nK0VEXKffhwOmJTeBlTInz/gcEnYFYN1aAGqG
 Lve+oc7IeNDYlv6lFGEpJhNNhkgXN3qcceTocwgGk2NjQhquJmiOb3g/8CUegheHMkeh9ScCA3
 Y+gpcu6H8Xhx0ONjA6wltxFzitYIZdMGK5+xhHmxHY+dTSK51kiVBgiKjdrdZTTpbsX0hVAnJn
 8MM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Mar 2023 00:12:13 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PSggJ5wR2z1RwtC
	for <regressions@lists.linux.dev>; Fri,  3 Mar 2023 00:12:12 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1677831131; x=1680423132; bh=4WOsAfpITDveUkLlKm0C8SxMPp9Wv2/hWv9
	cOYmED8c=; b=rKSoaoekCp7gDKYIuDHi1E5WDIjLw9z72q8c/HZhDXZibORf9pF
	YtCA+3zWjDk7K32qUuqLSVaqJpNFkEy1zv5JrrLGkjyKDB+CXUK9Ae844chPXM5m
	S4zcpQaj6wrIv+f2AjshPE1fJzDkmtuShV2q1RjFFXsjL9y01Ls0UVnz15aSKwUw
	Vkt3NLfKbExN4Sfm+4iwuNffr/HoccJFJVJIak7w3yKCFBd+r1TYb1yI8er3DgLi
	g/g3LUWPGZVEe+zMzw2pcgmKoy/PokQKjhenbNherhliXzhrCPBA/MduxeMjVWNO
	4BF36ogH7ROC2QTsJGdY0EgYZkx+sOb5RlA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id xM4as6bYe-j6 for <regressions@lists.linux.dev>;
	Fri,  3 Mar 2023 00:12:11 -0800 (PST)
Received: from [10.225.163.47] (unknown [10.225.163.47])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PSggG591kz1RvLy;
	Fri,  3 Mar 2023 00:12:10 -0800 (PST)
Message-ID: <414d105f-4197-9bef-18cf-f44d422ffd62@opensource.wdc.com>
Date: Fri, 3 Mar 2023 17:12:09 +0900
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [regression] Bug 217114 - Tiger Lake SATA Controller not
 operating correctly [bisected]
Content-Language: en-US
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Simon Gaiser <simon@invisiblethingslab.com>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, emmi@emmixis.net,
 schwagsucks@gmail.com,
 "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
 <linux-ide@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
References: <ad02467d-d623-5933-67e0-09925c185568@leemhuis.info>
 <fa07d882-499a-4d49-8ab2-679298f16c54@leemhuis.info>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <fa07d882-499a-4d49-8ab2-679298f16c54@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/3/23 16:30, Thorsten Leemhuis wrote:
> On 03.03.23 08:10, Linux regression tracking (Thorsten Leemhuis) wrote:
>> Hi, this is your Linux kernel regression tracker.
>>
>> I noticed a regression report in bugzilla.kernel.org that apparently
>> affects 6.2 and later as well as 6.1.13 and later, as it was already
>> backported there.
>>
>> As many (most?) kernel developer don't keep an eye on bugzilla, I
>> decided to forward the report by mail. Quoting from
>> https://bugzilla.kernel.org/show_bug.cgi?id=217114 :
>>
>>>  emmi@emmixis.net 2023-03-02 11:25:00 UTC
>>>
>>> As per kernel problem found in https://bbs.archlinux.org/viewtopic.php?id=283906 ,
>>>
>>> Commit 104ff59af73aba524e57ae0fef70121643ff270e
>>
>> [FWIW: That's "ata: ahci: Add Tiger Lake UP{3,4} AHCI controller" from
>> Simon Gaiser]
> 
> BTW, there is one thing I wondered after sending above mail: was it
> really wise to merge this to mainline two days before 6.2 was released?
> Yes, the change subject's makes it sounds like this is a hardware
> enablement, but the `Mark the Tiger Lake UP{3,4} AHCI controller as
> "low_power"` at the beginning of the change description shines a
> different light on it.

Yes, I made the decision to send this patch as a "fix" rather than a change, and
that was rc8. In retrospect, maybe not the best decision. But the patch was
fixing issues for Simon, so...

Anyway, will follow this. I requested more information on Bugzilla. The issue
here is that it may be due to the device having a bad LPM support (there are
many) rather than the controller itself. Need to sort this out.



-- 
Damien Le Moal
Western Digital Research

