Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC21333CD2
	for <regressions@lists.linux.dev>; Wed,  9 Oct 2024 10:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728469971; cv=none; b=QB26MnRfzapzRLT8ujznx8IyDI/OCSg8iy0yWPA4obA9dlCFEkHC5J+AsSGgkZBY+ciNzX4dDCA/IBh8Ysd7d8pQFyPSTVeeUma4DhCK19i1ExZiPOxrTMJiaVx7IAbkjAjhSpDYeDzpYKVNKdfuAA2NfZmDZ6CSQLkjaW/5AjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728469971; c=relaxed/simple;
	bh=00/H3CQqgYdCDtkqs80YGCL456r+PjV84Xa4blXq8P8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=OobT8rCoI6UtTl2fzcn9vn550reGPx9lE+bnGMfV5QFXBZzyoCI/PMLFfQ6cQ/pdu05bK44b3IxMRgyjCP+y4tj+eJppzggAhma8P6iv/ZWtmuN7POiqdc6d0WS43XfGBzWOZvq68+pTWtPz6gSpexItQBbOe0GPvT/cWeOFc9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=QrmYy2iv; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="QrmYy2iv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=00/H3CQqgYdCDtkqs80YGCL456r+PjV84Xa4blXq8P8=; t=1728469970;
	x=1728901970; b=QrmYy2ivyCZ9SB/l/uiPjVEL8fcK9WX+eLeHZdH90ceAi1fxsmH4ECTc4ZhTT
	lBrNcSHAMYJJFwoZ0lfLTp5urbEgyNMz7TVjnmOTrki1NEo1zGMJJ+FWg9izZa79q2POIxC0osr3Z
	5TVWEzJqoVu+m8xhld15xpTuS6VPyXwZ4TX+fBHbW7oJi7dbzt6Ze5BYgeTVLdZemK9mjz1JD193I
	Pwo0lHqUVWmOsfSsv/IJINiIVnhJc5djIs7OQpyHd1tTrwJsANIla+SWcKOQOf0jcfEQ/7hKjDGWm
	R5T6k4tJel9ZJTlfz784BqFFDBilhTG4fBclWwrJm6/njwsYHA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1syTzs-0006Ww-3n; Wed, 09 Oct 2024 12:32:48 +0200
Message-ID: <7cbe80d4-0a17-4422-8eac-9cd5415da086@leemhuis.info>
Date: Wed, 9 Oct 2024 12:32:47 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1728469970;7a44ddf7;
X-HE-SMSGID: 1syTzs-0006Ww-3n



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20241007132555.GA53279@francesco-nb/
#regzbot introduced: v6.11..v6.12-rc2
#regzbot summary: Kernel panic in clk_imx8mp_audiomix_runtime_resume

#regzbot report:
https://lore.kernel.org/all/7ae0cd7774f4b3e30cc033a7e543546732dbced0.camel@ideasonboard.com/
#regzbot introduced: 9480db72e17b5e
#regzbot summary: drm: lcdif: display stopped working

#regzbot report:
https://lore.kernel.org/all/AS8P190MB1285D7871E746D824330F1C4EC7F2@AS8P190MB1285.EURP190.PROD.OUTLOOK.COM/
#regzbot introduced: 6aa8700150f7d
#regzbot summary: ALSA: usb-audio: kernel crash with Apple USB-C headphones
