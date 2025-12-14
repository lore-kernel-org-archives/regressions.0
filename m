Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2068229BD94
	for <regressions@lists.linux.dev>; Sun, 14 Dec 2025 22:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765749885; cv=none; b=J/AIZRHyDX5LXBCyDoqVRCx46XowwcDra6ae6j0TK/Krr0TjvbOvpyDQ61N31uWMDWsHRD4Ispv9QsCYrEqI1c+vomSV4ngBGiowpNtcmbEzCuR/Me7JXuMa76EG7jEZewuZ9lle6wmEKoumvsLswk2efG8BbJpe04buJeYNV6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765749885; c=relaxed/simple;
	bh=OsZtNvC57Q0MTvQ0L0dGnqvyWUsxJxn5my2UaWA/0e0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qAZxX5zrupV/bRsSirUNmIFv2N/38pTyxkS7ldr5e3nECe6yy0WTdSZLo5wRZkU1YN282DKMzZttvCXgBJ73tKGPjKgsbecCeK318jYx3KNo1d9DikRXnuYkvdsTk0G6MfmOmO4Sx53aaZ7bW8AXmFhm0sVOJxOc6eSfE1w+6nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=IDP3n/Qr; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="IDP3n/Qr"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-88a35a00502so3737146d6.0
        for <regressions@lists.linux.dev>; Sun, 14 Dec 2025 14:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1765749883; x=1766354683; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/cTj72ha+a5XJMJvRmgDZDY2gaP3p8aX5U73ylQ5QC8=;
        b=IDP3n/Qruo8QWhMYfQM4tSeGjPKlCa82S56T2/ebW04mn6umST4yiP98qiutU1Sj3S
         /8Hyjez6QbuLr1QAIXcrrOfRZYsS7Prk/8CsDj29QUtCveQn/i40kYwH1xfHulBT6+gf
         /IQajBJwqEJhHMNBpUxOaJUT8pqDZwZ16apTra2FOS7Ent5ZAYEah1OWtebGs1WyZDl8
         C/RTtnTr0WcGhvgSKpPvKh6B7UhFWGBMmVZvhywu5TR1NB1Em1zByF/FmT7YfERLDo22
         Ln+MQEDL58bGfUNshWhQjsp0wblRRivEX8sVkU6ME2XCQ+BCEWotuTr+ijL4oEphdTJV
         XWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765749883; x=1766354683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cTj72ha+a5XJMJvRmgDZDY2gaP3p8aX5U73ylQ5QC8=;
        b=G1cRejjMU8wKtpnjtmHhoPVKxX4gr0Tk1UqCpZ1M8GfkN0dO5/cRdZdP/Mwm8xsF+E
         1O5Ag/L2NpN/EGb92ztWlTZZmKlXQN/yWB7GruHAi+iT4i/UlNGrqjjKBmckmHjp4pJH
         QsZ6XK+1Jvr9isM2lDSZ7TelAS4W108SkYky3iJMK7WEnuc04Wud+269Z2p0y4eNVU6a
         t3vW+TITCXH4dSN9QksZA19DMpo+a7uK4LmaecgcTa3/IVNQ2UeibKaM8YFpwVsym+hb
         F1MdPL/MTC89I82CWmNGcj4FcfOIX71TZcZ9H8UFHPs6Aag+9j3Ld+SzlB8TbfZYSjTH
         r0Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWvjshhRiPsfhDztJcH73YEPmM45J98+BRVvTnB79wegiGWrdKkui+zyLqBhVf+NooArEiijrWFZTzedg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwuDcxUPbqCZvX9joOzCgZ72IJym+Cs7lO1iQMpvhfdmlz+wKG1
	HoPc4z0Sqt+Mt1/lBVC3Wirsl+7QeSe/7w/j3WtiH2vKoCEXjA+Wvhiw/mSAzXnnKuw=
X-Gm-Gg: AY/fxX7w1p9OSFvlcdJ5CY4smj1bVBbsTwwQlRwh5t5BS8IzqSG4xwCh1O0+W6Ii/bI
	rmVq8/ZgWzhCNdspgEhYsdT92uQKRvrdkVcoda4kawIiO21a/vzeAwQdpHdnPb1Xk3o/t4Y3lrs
	DnEFRp0IK6z7A940ErwfQGil2H8c67qxpjOMnjUenseFbYyg8IYDV2tQU3MZ8YcierTaHdysSSM
	EBlZ/39rmXXSCJWmD15dLZZXaWjUYDA6qYV2QXJsGeBVAgBwKDDVFoy4vriucLahCBmHCebWb2q
	CWGM5XeeYpxWy3O9jgcothRj5vD+bIrS9AQHLEYXQnvIZtbvsmyjzRo3e1PPPhymjNMC7W/mWtp
	/kwn/Nl9PjWX+R+g5oWDOh+R7QUODnKw90hVaM2QEjmXsOYXLppfh+ogvQV+DRLA69vXybCyeMp
	fuXV8/Flami1pWhEgLjdtNTtZuQk8F8wlu4ForqcV2
X-Google-Smtp-Source: AGHT+IEDFcxqfAIv8Lzvd0GjECj/WpfJVYeBMCOAIQ4Nzc4ZxKDvXtd5bV1zeaqceaQ7pMz4WHhP1g==
X-Received: by 2002:ad4:5c48:0:b0:880:5cc1:692c with SMTP id 6a1803df08f44-8887e1957ccmr128935286d6.17.1765749882988;
        Sun, 14 Dec 2025 14:04:42 -0800 (PST)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-88993b597f7sm39205576d6.14.2025.12.14.14.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 14:04:42 -0800 (PST)
Date: Sun, 14 Dec 2025 17:04:41 -0500
From: Nick Bowler <nbowler@draconx.ca>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	linux-rtc@vger.kernel.org, Esben Haabendal <esben@geanix.com>, stable@vger.kernel.org, 
	sparclinux@vger.kernel.org
Subject: Re: PROBLEM: hwclock busted w/ M48T59 RTC (regression)
Message-ID: <2t6bhs4udbu55ctbemkhlluchz2exrwown7kmu2gss6zukaxdm@ughygemahmem>
References: <krmiwpwogrvpehlqdrugb5glcmsu54qpw3mteonqeqymrvzz37@dzt7mes7qgxt>
 <gfwdg244bcmkv7l44fknfi4osd2b23unwaos7rnlirkdy2rrrt@yovd2vewdviv>
 <48db01b1-f4e5-4687-8ffb-472981d153ed@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48db01b1-f4e5-4687-8ffb-472981d153ed@leemhuis.info>

On Mon, Dec 08, 2025 at 03:35:42PM +0100, Thorsten Leemhuis wrote:
> Lo!
> 
> On 11/26/25 04:18, Nick Bowler wrote:
> > Any thoughts?
> 
> Not really, just a vague idea (and reminder, this is not my area or
> expertise, I'm just tracking regressions):
> 
> Two fixes were proposed for the culprit, see:
> 
> https://lore.kernel.org/all/BN0PR08MB69510928028C933749F4139383D1A@BN0PR08MB6951.namprd08.prod.outlook.com/
> https://lore.kernel.org/all/BN0PR08MB6951415A751F236375A2945683D1A@BN0PR08MB6951.namprd08.prod.outlook.com/

The first link is a patch for a totally different driver, as far as I
know not relevant to any system I have, but I guess that makes at least
3 different systems which have regressed...

I can't figure out how to turn the second link into a correctly-
formatted patch file, but since it is a one-line change I just manually
applied it on top of 6.19-rc1.  This appears to fix the problem.

Thanks,
  Nick
