Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFA414A606
	for <regressions@lists.linux.dev>; Wed, 11 Sep 2024 10:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726050428; cv=none; b=g7oSJeEagofwF1Xiyqk9OIVzSl8GfMF4xoytfp08Hr9REjqKAChSL0EDSf5pyjGo491c8HLLJ1SqBn5+7whu6trpCyndCNu5WCrb08AjbfrVNV62qIIlxZcJSdOLpBpqJDX+8HkPvjRYtpRkqXo5qK1foc40aXbMUzTXFef28hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726050428; c=relaxed/simple;
	bh=z3wWS+Wn7S/LvcrpVh3W6PL5vcl4MIkE/BAo6m/hYHM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=XYyQ2FeDKBh5FZMVuL+WyCa/SEpeqXxeOQiHOm2/IdLQSnDpma2Sxmt8aS3aV9o4pgF4RtLKW3/ymMATL6YqMCcpUOGE3luA8igGKh9jcvsLydY/iIn2cnrT4j/4s+dq51P7JTyROiRpVqLhdy/dBUqFPbwhElcrPVExcS57b+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=RO3Zo3md; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="RO3Zo3md"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=z3wWS+Wn7S/LvcrpVh3W6PL5vcl4MIkE/BAo6m/hYHM=; t=1726050426;
	x=1726482426; b=RO3Zo3mdLSiAiLi2xYmoQTo0nUAnhTyK6WJ5HpvQYVYLfIsfroaem8gKuFnP8
	mIg7MZqXwbdbRkpHeWVORsCPAtXhgHyJ4dFx1p9F6q7PITi2/iECv2CXDBWy+0iCdH4vWrFbMfhnu
	w2wjrQK0qcaGP6mdeOla9rtDqdGBnvhHPon1SmtYNqRyQc/VUBTe0ZzKMsks9Xqpq268YfiC034du
	AoHKZXjUL8QTFFmpLA5kfOGRbYL2+hGzJrXliZOb0RjMK/Ovbfovgts5DSY95PUUhUlSG2wfGKDkn
	PLteOMuHw1HP9Snpe/hohr5T94HzkiNDgMYh5dxOvMzTmenjfg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1soKYy-00063N-6W; Wed, 11 Sep 2024 12:27:04 +0200
Message-ID: <dad3b482-1074-49ab-9245-803cba044114@leemhuis.info>
Date: Wed, 11 Sep 2024 12:27:03 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1726050426;98f0ffba;
X-HE-SMSGID: 1soKYy-00063N-6W



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/CALvjV29jozswRtmYxDur2TuEQ=1JSDrM+uWVHmghW3hG5Y9F+w@mail.gmail.com/
#regzbot introduced: 5186ba33234c9a90833f7c93ce7de80e25fac6f5
#regzbot summary: x86 cache: soft lockups on boot

#regzbot report:
https://lore.kernel.org/all/191d810a4e3.fcc6066c765804.973611676137075390@collabora.com/
#regzbot introduced: da9619a30e73b
#regzbot summary: dmapool: occasional fs corruption seen on 64GB NVME
devices

