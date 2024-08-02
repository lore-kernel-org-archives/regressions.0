Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7021C2327
	for <regressions@lists.linux.dev>; Fri,  2 Aug 2024 12:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722600435; cv=none; b=Ffbpi7gj9NfAHPXBfS0p4gAGPSdGbJ82VUbfgogZVpCIOPxENiB23ad7gtx7Zagzcax50KgORt47LgqVwPhxLiAD5uYKLQJpo5lNajJNwLQPgXn/qMEnwFMNlyx9QuSdR7DMu4IF/HNUi187GNbWqr4Ek4cOrfS9rBDl7SY5nqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722600435; c=relaxed/simple;
	bh=QBRkjrDckM68zEssK1/pk3DFZl3ezC4O4MyAx3z96sE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=TTrc7Xkv8KWNhxvFFpW8Voxzz1KpI7fTpTwAXTUNKpJDthNqkLg8fKMVl5//hcXbYSVXqf0+DZMqTYGWUvBotA4FD1YGlG52moLFYdIaJyhJXXuLv6OIuCSh/kdfufMrj+6okQC/5SQmFP0k4P21QtjbGml4REMo0tzxjr53wq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=jAWRAR3o; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="jAWRAR3o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=QBRkjrDckM68zEssK1/pk3DFZl3ezC4O4MyAx3z96sE=; t=1722600433;
	x=1723032433; b=jAWRAR3ofw/j4WbGqrfAzrG0FppYLRfE71urNZWY7SVfHnO8HLS17XQms3Fah
	AF/Om5UCKgEnxR292L+jJ78gH4106Sy5rxp/F3ChBGsxMiUkJC5FoGItUjTdVp55pKlGZXAPR3lTK
	4ka8dXmditdSp3yCX9k5iBvzUeeyyeVBJbIq9LaMjVE8qsW15XHSCPfGZuTAPb8yHGxE+fr/I1mBp
	Do55cy6Z52ke5hAWCZtCfO5DbpftM/OL2RiRNZY6YXnpxyP+OEnvhTfhverOCCEIvKojd9egQ1K5V
	IFbFDEjarq7HhIcBMJg9VpQ/H4tbXrRotUoC0/xer88pr1Vhzg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sZr3v-0006Pl-LC; Fri, 02 Aug 2024 14:07:11 +0200
Message-ID: <348fc7ae-a7ba-482b-a14d-a83b76637b89@leemhuis.info>
Date: Fri, 2 Aug 2024 14:07:10 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1722600433;ca0f0a79;
X-HE-SMSGID: 1sZr3v-0006Pl-LC



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/regressions/dd878fc236840921d3e31944e26694fed941d0c6.camel@lrz.de/
#regzbot fix: smb: client: handle lack of FSCTL_GET_REPARSE_POINT support
#regzbot monitor:
https://lore.kernel.org/all/20240731132339.471321-1-pc@manguebit.com/

#regzbot report:
https://lore.kernel.org/all/b7ecddb7-4486-4b2d-9179-82250cf830e7@roeck-us.net/
#regzbot fix: x86/mm: Fix pti_clone_pgtable() alignment assumption

#regzbot report: https://lore.kernel.org/all/20240801165146.38991f60@mir/
#regzbot introduced: 2052138b7da52ad5ccaf74f736d00f39a1c919
#regzbot summary: media: dvb-usb: TeVii s480 dual DVB-S2 broken

#regzbot report:
https://lore.kernel.org/all/CAHj4cs9Ax1=CoJkgBGP_+sNu6-6=6v=_L-ZBZY0bVLD3wUWZQg@mail.gmail.com/
#regzbot introduced: 15995a35247442aefa0ffe36a6dad51cb46b09
#regzbot summary: mm: general protection fault observed after destroy
the devdax

