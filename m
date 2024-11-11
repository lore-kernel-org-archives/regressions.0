Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FB319C569
	for <regressions@lists.linux.dev>; Mon, 11 Nov 2024 12:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731328086; cv=none; b=SfWMAIcUaDhRwaMruh1jYZ/TaYHE7+iVCzrwvWgtN+yR4QymtnqdXIKe8NEm1X18B4djoYBak5VY200iXtJzR7Bi88lyDahzZaMEun17vPsa8NTOTEnF9uhKPt3yoNMq9C/D/rCGFUiWrWXxBSj9Jd8L+WE9jY/V8vvc29mQKd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731328086; c=relaxed/simple;
	bh=qutuyKkbulqjG0/Unxh2RQ5wJ7+DKM4GSbPCKDW6R9E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=pT3XtwsCJnRPKGjfFrT3CV7iLohgndhMGgDuWrbz6+0349lbWuoeF22LRoKUJ3n7yP6Q/zFSYAHpcD47aR4UBE2RDAy9E7SWY9KxKHxPUyaXnohYjmxw4hsTUyGZshpcyFTXqx5Qwr+OK7VxUxuHAFNGrFDw625qj3Sli2uQ0Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=XBHNKncg; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="XBHNKncg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:Subject:From:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=qutuyKkbulqjG0/Unxh2RQ5wJ7+DKM4GSbPCKDW6R9E=; t=1731328084;
	x=1731760084; b=XBHNKncgvigngGNE5GAMyqg2hBc/df6rUldX0EuOiYtqtXEgKqJbour/l1a3n
	8q7j8FSwt+0HC5pv5DK7zOXpGYrewaKHs/vP7deJguNo246Hz/9p3m5mYhZSAj8AEBXeE0qI9qgsK
	3HTO/B4wbfonOlT4u/Le2yepAr87afMVf+c7KC0ryfMWrGFoJnyI8EGAasdRs7qXapkZQ8tPLDB/d
	GwyJ/KHVGKxNYDX3qoXU1VVcxUG8yiOmsEUXtOram+DDW2NJ1hXTqh5TVvFB4coso8x4swaik/+mo
	cf6Hs1YsUyyeMbzipq0a8+uGmYBK4uHP24XHi7Rg+m+6HF0Skw==;
Received: from [2a02:8108:8980:2478:87e9:6c79:5f84:367d]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1tATWU-0006EQ-Bo; Mon, 11 Nov 2024 13:28:02 +0100
Message-ID: <64725ec1-4c56-4d2a-9c30-3aeaa4817347@leemhuis.info>
Date: Mon, 11 Nov 2024 13:28:02 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-MW
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1731328084;192b7509;
X-HE-SMSGID: 1tATWU-0006EQ-Bo



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://lore.kernel.org/all/uikt4wwpw@gentoo.org/
#regzbot introduced: 251efae73bd46b
#regzbot summary: HID: multitouch: tapping on the touchpad broke

#regzbot report:
https://lore.kernel.org/lkml/ef7c7a96a73161e0f5061503242a8d3eddef121f.camel@gmail.com/
#regzbot resolve: inconclusive: might be fixed and likely not worth
tracking anyway

#regzbot report:
https://lore.kernel.org/linux-pm/20240908144414.82887-1-hdegoede@redhat.com/
#regzbot fix: 78f281e5bdeb

#regzbot report:
https://lore.kernel.org/lkml/1a3af354-bd15-4219-960e-089b6a6e673c@adamthiede.com/
#regzbot fix: 995d4d558eea

#regzbot report:
https://lore.kernel.org/stable/20240917055730.Horde.pVyI-XF1MRA_zUQ5BDJZ4lC@ignaz.org/
#regzbot fix: aa70ff0945fea2ed1

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219394
#regzbot resolve: inconclusive: can be solved by a config change, likely
not worth making noise, unless more reports come in

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219390
#regzbot monitor:
https://lore.kernel.org/lkml/ZxjLQzHKuR-w16hF@pavilion.home/

