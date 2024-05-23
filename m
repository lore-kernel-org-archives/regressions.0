Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FE73307B
	for <regressions@lists.linux.dev>; Thu, 23 May 2024 11:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716464949; cv=none; b=OwZcaXU83P1wmOqBvO6iQSUZXA5KTEn56aYdHQ6YLSu8B+sdEs05BduYXMLo8bIqfX5kPjKa0/a3dnFe3yZ8M9bVB1OZZWwv5WcR/wg7eS1GA5Kij50qFHY25JIEqSrSvZrkkcRQUvkenrGmZXiQRdcYeQ5uJ1IqOty7pteBY94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716464949; c=relaxed/simple;
	bh=1MDIqHiuEpSxwpRG9Z4UhK2FyAQCSAh23QIOI5rpSdk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=HyLx5unrJ9L+rd34aH+uF9UIIzMwks+0mfIuIdNrdzT+tgXb1LHEVoAukgLvIQ54nX5IqD9uoaD6VcBaDFRgE4Z+qcK2cqdyR6vu5rmT+rYjLkKYy5iuZQhQJywnDeY5QyoKNMZXl8FmiC1aottwXnDO+2h7T6uPxV6bhN07lmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=en4eaiTl; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="en4eaiTl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=1MDIqHiuEpSxwpRG9Z4UhK2FyAQCSAh23QIOI5rpSdk=; t=1716464947;
	x=1716896947; b=en4eaiTlpkyP81kAPIBzC+ezXi0m5BUXxSPX4SpEoMPNI5JbJErBWJfa1fIYf
	Py2RSnfROHyvMflwLRclKy4c5tPtj3SUKgiOD+1HOKnumthdx3yZA/OU3L/ugd+g1fhnAWRcIcP0y
	XcE7g8d33A3JVEU0fn1n2L2yhGq+EYQWDYixiWUrzbqYpM8BnmZ6VQxsy6FSOmvXQJ1ZFv0d0TCvD
	lVb6hztPTLqopIu/0nbqx4cDJ2D6O6BrJEt1X67jzObteNbpONjC2+QkBwsHEeobmZmhJRUffJ9pu
	eA+BJBstzMNfD+8V0NWXkrfkJFs90A6BtdtIAe2RyVeL/uP6Ow==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sA6wS-0002Wx-TO; Thu, 23 May 2024 13:49:04 +0200
Message-ID: <4981f387-8d87-4020-b181-368945e576e3@leemhuis.info>
Date: Thu, 23 May 2024 13:49:04 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1716464947;36d58878;
X-HE-SMSGID: 1sA6wS-0002Wx-TO



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/linux-arm-kernel/D1B7GPIR9K1E.5JFV37G0YTIF@shadowice.org/
#regzbot introduced: aefbab8e77eb
#regzbot fix: e92bee9f861b466c67

#regzbot report:
https://lore.kernel.org/linux-ext4/20240518022646.GA450709@mit.edu/
#regzbot fix: 825d8bbd2f32cb229c

#regzbot report:
https://lore.kernel.org/linux-input/0111018f7508efb1-1206661a-d4b5-4bd1-b54f-ccb8504b8b4a-000000@us-west-1.amazonses.com/
#regzbot resolve: invalid: apparently not a regression after all

#regzbot report: https://lore.kernel.org/all/yw1xo78z8ez0.fsf@mansr.com/
#regzbot introduced: b914ec33b391ec
#regzbot summary: clk: sunxi-ng: common: HDMI output on an A20 based
device broken
