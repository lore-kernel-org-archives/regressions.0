Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49881D5CC9;
	Sat, 28 Feb 2026 09:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772272695; cv=none; b=tL1doMaVNnWkyHQ77UutHroPS3wqVx9BlXn7nERO+DvjNbrbI8oxeZ7/RJkIi+7vWqzhYl/wR/+yzoUMr+61hINjvzHGcXohrbwg7r9Zj+HMjiB//tLd2+KjRbmCQ1lxSDWzk4KbK2jWE4QIuvu11yffqO0E/PY0g/46WG0GFiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772272695; c=relaxed/simple;
	bh=D641L7nN+7flIncXdr0cYkGLrdyeInDC0GL88pcgfRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d9Jw9a7jwYz5NCOXTYmi8mJDiMReOC34rDCOQONVP4HavAvFkzAmOZFVBpS+3DIHCkM0PCrqHRI23n2vdSkj76mUmX3VXsoY6mw0SiqQAI0Bs73Vcmu4djKLkiNFLGavzttE+K3/YZamaZ5NDOTKUPn7Qbt/kQ9nwjkoNSTWtRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=skogtun.org; spf=pass smtp.mailfrom=skogtun.org; dkim=pass (2048-bit key) header.d=skogtun.org header.i=@skogtun.org header.b=KjGAOeBF; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=skogtun.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skogtun.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=skogtun.org header.i=@skogtun.org header.b="KjGAOeBF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=skogtun.org
	; s=ds202512; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:
	Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=117BCoJJ/H3AmXZJ9Y3SKLKvCOUtyl7An8R+R/KuqTk=; b=K
	jGAOeBFqbcVlL6KEit7zN+JqASADHHZqH9bNXY2qPrzjPFXTvIR6k5ZiJ9q38OpM8Tk5f+jjXO3IJ
	lXlqySeKDP/v+n6l1JKtjJLaAMpE0CIQyGOOUdBCxu4XKZ0ri+YmDrn+e9LBnruFNNl+l5i3RyfdE
	4zHgx682eOorS4kPn1NC608VnO3kC8eSVfxhOwWOf9T1RC52MqYNOKSNLyFOkW1nRLMlrwda0DSXR
	N3FcaokF907RT4cPgKXhKmPly5r2KVZecYNBtGYXRvED8Clnd5boiQqy2wBnWr/3WiZ0fBmTFoEQT
	k/Sa47x7FAG4Jp7/p4AK8H6naL2yTsKBQ==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1vwH5P-008TSN-NF;
	Sat, 28 Feb 2026 10:58:11 +0100
Message-ID: <75659f23-d823-4572-991b-5d44b29e1b91@skogtun.org>
Date: Sat, 28 Feb 2026 10:58:09 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BISECTED]: Black screen on 7.0-rc1
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 David Gow <david@davidgow.net>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <18b0ead7-0a5d-4699-a09d-de5bc2208b68@skogtun.org>
 <CAHk-=whsxHKbtSpiqqQ1V8YDh_zu+CMB=Zt9MxUOmWGocueZNQ@mail.gmail.com>
 <245628b6-6cdb-446c-824d-442100c89da8@skogtun.org>
 <CAHk-=whxJBPZ=7jpAKgz+5hUjJZ129JJsyA6iEw70Wg58hD0zg@mail.gmail.com>
 <a200d310-e3df-48e4-8376-7bbbb483f2eb@skogtun.org>
 <CAHk-=wgUmxkjwsWzX1rTo=DTnaouwY-VT8BjrTqfH7RmTwO72w@mail.gmail.com>
 <67f655bb-4d81-4609-b008-68d200255dd2@davidgow.net>
 <f347b759-c3c6-40fe-86b2-b89ac6fd2d5b@leemhuis.info>
Content-Language: nb-NO
From: Harald Arnesen <linux@skogtun.org>
In-Reply-To: <f347b759-c3c6-40fe-86b2-b89ac6fd2d5b@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thorsten Leemhuis [2026-02-28 08:22:52]:

> TWIMC, John ran into a problem with mentioned f2ae92780ab9 commit that
> from a brief look looks similar to the one Harald reported. And Takashi
> posted a fix for it here:
> https://lore.kernel.org/lkml/20260228031255.GA832746@workstation.local/
Yes, that simple patch fixes it for me as well.
-- 
Hilsen Harald
