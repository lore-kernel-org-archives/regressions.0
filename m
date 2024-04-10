Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6428BC127
	for <regressions@lists.linux.dev>; Wed, 10 Apr 2024 04:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712723321; cv=none; b=KN/2zS6Pb6owRnB1S/bz080mMx1TKJr9UdWZX4R5pG6BIddM1Rjgp3UMh+lOpddFpnMsJv3oJCzRvMA+WO0AwIPkk+6uhrUcgrV4rBnvt8FSNHow4yEPtFPFUnsB23vjQsBRk7bFB7hDa3FY/INGF776FqdmT7+8WNcDVC4Cw4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712723321; c=relaxed/simple;
	bh=2u+70epJjW00+Aasor34vmJ+f/znX0w0jA47UJBKtDg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=XC5/4QbxQmgTcOWyt4f+ZtIZzPwG8SJqizNHj5W1eezIFhPXbV3PotzxWxB6fGn+jm9AhYGc3vlJpmu+z7lc8SyFB3Wa2pw9Xm/CZJlGd3Qgc0PT58tTZKhPXwC7gxe+e7jB4a7do98mkpO10fV/JdNByNgqBXW9nfhyOisnX54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4p6QPlZ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4p6QPlZ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e50a04c317so95125ad.1
        for <regressions@lists.linux.dev>; Tue, 09 Apr 2024 21:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712723320; x=1713328120; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2u+70epJjW00+Aasor34vmJ+f/znX0w0jA47UJBKtDg=;
        b=h4p6QPlZ5Nbc5Z7CCHmg2sECsCAtGGu8UZGojtcRTFX5QYAB5bzKS8CPCki9n+qmQt
         pWtnfOosq1dNDr8MGRTen0URQ0mhGJHew0t+AJ/7lxQ5GZN+DIVXlM6P7kYcmMpxvTdI
         aIcpHgfbyacK2yd1aKYmeNfbwuPDculOkq6SgGh0tk7jE8wxujFEasbPbplicC7of/TC
         ZHezQa927Y0VVncy5rZB4OosoRx1YO5yyRd9azlooeIcGOzsoyb84+SiI6VOlAwz+0M1
         tTRaVBxaZHI51Q7cLe9WtSOHTUMLJdjx9hHBxLMDct1rP6uJdRBaFHwoW5J4Z7HPXlhj
         +7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712723320; x=1713328120;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2u+70epJjW00+Aasor34vmJ+f/znX0w0jA47UJBKtDg=;
        b=C4dvkW5akEIbeWc053u/XBmzJ/18HX/FzWqLwtyLZhhFv1f2XY8YtTdsZ68xLoNG6Q
         smsBd0lvXmUp9IA6InSsn07qhT5aPHWWeI+tovRKFqeCVA6vdXre0xmxJmxi6+1YZU2I
         XZJQSi0SKxgiDh8CVWjLeQmMfHJ17KWVwLktK1Br9eQzr5n4ycpc6Js3vnkXN/8AEeW1
         Id6LPTT47IvT0uhFh+9dsU4b2r1rwB9uhEB7uMnHOaew821Jbhrk+zx1VWxKc+gACOeV
         z10RnYSzbZpUBPdsEU7OkVHf0ZQqhI+592V3q0kSaqiabYpAPpFKa7A39q36aqPC0Hlj
         Qj4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjVkOdp5Etfv1aNn+0j7sEo2bWMGm7qKc3iMMWtHgDm38Hcj+XMl5fW98SW465NAz6HSXB8FFoj7KomHGmuwMcbAWKJ9at+BDRSF8=
X-Gm-Message-State: AOJu0YzDt9g8LQ4GodqVocwRaC5l2hMCYQPFfyOeLqp79pGhrHp1I9p+
	8viGnqOfLobbywqQ30UeKkv5XSYGyyrr833Ypr38Kbos4c3suUYJ
X-Google-Smtp-Source: AGHT+IEe7rAnY9uQDbz0Y7OlDS91jLim4bdEpY9FTdShRZXCnoeQFpggWylXUmXRifVvfewT7s5iJQ==
X-Received: by 2002:a17:903:228a:b0:1e4:c75e:aace with SMTP id b10-20020a170903228a00b001e4c75eaacemr1883931plh.29.1712723319585;
        Tue, 09 Apr 2024 21:28:39 -0700 (PDT)
Received: from localhost ([1.146.50.27])
        by smtp.gmail.com with ESMTPSA id s1-20020a170902ea0100b001e042dc5202sm9721472plg.80.2024.04.09.21.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 21:28:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Apr 2024 14:28:07 +1000
Message-Id: <D0G5QG4M991A.1QAWDKSYM6A89@gmail.com>
Cc: "Jordan Niethe" <jniethe5@gmail.com>, "Vaidyanathan Srinivasan"
 <svaidy@linux.vnet.ibm.com>, <mikey@neuling.org>, <paulus@ozlabs.org>,
 <sbhat@linux.ibm.com>, <gautam@linux.ibm.com>,
 <kconsul@linux.vnet.ibm.com>, <amachhiw@linux.vnet.ibm.com>,
 <David.Laight@ACULAB.COM>, "Linux kernel regressions list"
 <regressions@lists.linux.dev>
Subject: Re: [PATCH] KVM: PPC: Book3S HV nestedv2: Cancel pending HDEC
 exception
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Michael Ellerman" <mpe@ellerman.id.au>, "Thorsten Leemhuis"
 <regressions@leemhuis.info>, "Vaibhav Jain" <vaibhav@linux.ibm.com>,
 <linuxppc-dev@lists.ozlabs.org>, <kvm@vger.kernel.org>,
 <kvm-ppc@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <20240313072625.76804-1-vaibhav@linux.ibm.com>
 <CZYME80BW9P7.3SC4GLHWCDQ9K@wheely>
 <a4f022e8-1f84-4bbb-b00d-00f1eba1f877@leemhuis.info>
 <87sf007ax6.fsf@mail.lhotse>
 <cb038940-63fd-4348-bed2-13e1b2844b92@leemhuis.info>
 <87y19obfck.fsf@mail.lhotse>
In-Reply-To: <87y19obfck.fsf@mail.lhotse>

On Mon Apr 8, 2024 at 3:20 PM AEST, Michael Ellerman wrote:
> Thorsten Leemhuis <regressions@leemhuis.info> writes:
> > On 05.04.24 05:20, Michael Ellerman wrote:
> >> "Linux regression tracking (Thorsten Leemhuis)"
> >> <regressions@leemhuis.info> writes:
> >>> Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> >>> for once, to make this easily accessible to everyone.
> >>>
> >>> Was this regression ever resolved? Doesn't look like it, but maybe I
> >>> just missed something.
> >>=20
> >> I'm not sure how it ended up on the regression list.
> >
> > That is easy to explain: I let lei search for mails containing words
> > like regress, bisect, and revert to become aware of regressions that
> > might need tracking. And...
> >
> >> IMHO it's not really a regression.
> >
> > ...sometimes I misjudge or misinterpret something and add it to the
> > regression tracking. Looks like that happened here.
> >
> > Sorry for that and the noise it caused!
>
> No worries.

It is actually a regression. It only really affects performance,
but the logic is broken (my fault). We were going to revert it, and
solve the initial regression a better way.

Thanks,
Nick
