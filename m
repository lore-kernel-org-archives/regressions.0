Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB64314D22
	for <regressions@lists.linux.dev>; Mon,  3 Nov 2025 17:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762189973; cv=none; b=FhziW6uS+V6H8vKEug4TuzTDnLBzLRkvqFpsAqo+p8SY4RW+rOS1eyhnjHuyQhe2xtldkyduCVr8BLpN+oWz1mkFjkxPxNoLHkL5+7fQHwvNKb/PxUXCy3Vh28KUjLp68fC3p+Hr1eyImNcy+zZN7ks3oyEV5YFqZJRAz4lV4vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762189973; c=relaxed/simple;
	bh=kDarkteaSnf10lfwAsM0uNbYYX1j31SFkq5885N1grs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KSeEDYD43bzxMORyqolgJopZk3Fpw0KrxD51xdEMVwf3l/AO5tS6LAypE7QnGw9bX8s0r657Tse3jZbJScjdzkLTUmA3kiabUz2yXt1r30vcz3LJg4iwHUiBAMVhgB6yMTW09xAknX1L+fSK3MnIe1SDo13Oau3w8VLiu0ozJP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XK4rAFZL; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XK4rAFZL"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so854031766b.3
        for <regressions@lists.linux.dev>; Mon, 03 Nov 2025 09:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762189970; x=1762794770; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0L+x6u92PFUYymdltbOhgzGP+ZfkmtaHqsZECM78beQ=;
        b=XK4rAFZLtY5qON8TCYVMtRp9Tv7Ua8B/rndlRF8PALNd289sWHhPXlms5kXo5aztNx
         +4Fbo+i+xZ02y19J5gfZPRmIjfH4XixUt8nrVLtCrnT8dtQwX3Fw30Q2xDmgIRa9+2T6
         AJQnlEID1ERZ+QHL0hb5xpirm45JueqXoD4ZcQBjNZaYmOrtVnoBqwW2T9UWumc7HBaI
         aM5fx4jCJ5W+HSYFJN0W2cxKQal2R3GWcH1pfFWWVShkf63e3kWrIYp/GUSFd3vlvZhE
         2vE21iOUZ+dXEhE3pCCcr9L0zbdI6vbofmcV5cfo476LDupL14wQ3y9sN1JOvvzatd6u
         vRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762189970; x=1762794770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0L+x6u92PFUYymdltbOhgzGP+ZfkmtaHqsZECM78beQ=;
        b=Pk5DFyFkzb/dl3xAsYkiYQWKeI8uKa6JAkQYp5HfF1XqJK/vhRObGvQyLkRPHFFEno
         bLQcyFUAqt4wGt0yZ6KwVmNZ9jj06eAhNeYbQimU3UvJ7MD1jGT3oIXBoQ3J/wKJd2Df
         C8XM9AsOMpf71qiV22WXWbTuEQ1QoG6JQGyheQm224lEYjuj2AxcK38UFMP30RegndCG
         oOzQT0G6pRK0PXuuaCHepm66POQddNRWgZkZBSlUn90zAzyEgoYt21RdZkushhYrFlgz
         McZtB5Yy8Kacie6NLbDuAdzPKk86hzASCZv6J1263Sz1fOSrMmsdYClOmS+IQtbbsjLB
         sQ5A==
X-Forwarded-Encrypted: i=1; AJvYcCVjJUENelBmjMSVuWEFq6onpg39H+W5BAcMc/sSoQ2IITyRD1t1gQCFRIQIaZpZ+AoLEMi6i3xM9zLQ3w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWSaRTDGkVJ4PJ5mmcjk0iGtFRoQKQSVfTby63ygb+n1nzmtPh
	tSrazYRO5Ok6D1+tTqpIFmDvqyV0aewDrP7Nu01tCEzVcZboWJBnCz7V
X-Gm-Gg: ASbGncs/beSD1Q6e30YeDfx0siKzC02YLXoy/qw4ViGylTsCMy0buFxHeeiDdNz+N45
	rEKNu4GDWnn1rzlQlpCLU66cqKbwOCGMA9GNZcCgAuul28g4/gok0VhhazKB1jcRy4vyJhwdkQl
	xEO02EIrGk7c1ZLZuAY98sfHWQ84ZBqoNuUArHjwXtxSz0TwgfWramvyFmweV9v8ZMDkeJkoQlr
	Sb2GYRyE/J+YaRo+eo52MDHnJP/aDvTEjt5VQzMiBdrlWQYCaQCNJkPUf9AgpoRxcyq4rfidAAF
	zMGJm8vERl7z3Eu2j/QSZ6zu74qGpXnd7U6SROKiik/O4i8dobYMJGbHfK2q5su8zobVKRbu/L5
	JOquc61fc0xg4Pm1korbsSLKE17wRPKRqv6utUnAz/hzxAhl6ewnPq4XpMMtrywQD6XYn9rO7ry
	xiaVRX5R+5tGsP
X-Google-Smtp-Source: AGHT+IFYSrn3+JLLfbrsA9O3z+gFUcu1TIraVBmewJp9yIRvtZodmEr6n/k/vgTpSkGh5NZ4ce3uwg==
X-Received: by 2002:a17:907:3cd6:b0:b6d:79fa:b166 with SMTP id a640c23a62f3a-b70708b1503mr1195109666b.63.1762189969903;
        Mon, 03 Nov 2025 09:12:49 -0800 (PST)
Received: from foxbook (bgu110.neoplus.adsl.tpnet.pl. [83.28.84.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7077c809dasm1075780866b.50.2025.11.03.09.12.48
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 03 Nov 2025 09:12:49 -0800 (PST)
Date: Mon, 3 Nov 2025 18:12:45 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: x86@kernel.org, regressions@lists.linux.dev, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Mario Limonciello <mario.limonciello@amd.com>, Eric
 DeVolder <eric.devolder@oracle.com>, linux-kernel@vger.kernel.org
Subject: Re: AMD topology broken on various 754/AM2+/AM3/AM3+ systems causes
 NB/EDAC/GART regression since 6.14
Message-ID: <20251103181245.7745621f.michal.pecio@gmail.com>
In-Reply-To: <20251103143851.GA8673@yaz-khff2.amd.com>
References: <20251024204658.3da9bf3f.michal.pecio@gmail.com>
	<20251024213204.GA311478@yaz-khff2.amd.com>
	<20251103084021.61971a89.michal.pecio@gmail.com>
	<20251103143851.GA8673@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 3 Nov 2025 09:38:51 -0500, Yazen Ghannam wrote:
> > I have this AM4 system with some proprietary HP BIOS:
> > 
> > [02Fh 0047 001h]               Local Apic ID : 10
> > [037h 0055 001h]               Local Apic ID : 11
> > [03Fh 0063 001h]               Local Apic ID : 12
> > [047h 0071 001h]               Local Apic ID : 13
> > 
> > domain: Thread     shift: 0 dom_size:     1 max_threads:     1
> > domain: Core       shift: 4 dom_size:    16 max_threads:    16
> > domain: Module     shift: 4 dom_size:     1 max_threads:    16
> > domain: Tile       shift: 4 dom_size:     1 max_threads:    16
> > domain: Die        shift: 4 dom_size:     1 max_threads:    16
> > domain: DieGrp     shift: 4 dom_size:     1 max_threads:    16
> > domain: Package    shift: 4 dom_size:     1 max_threads:    16
> > 
> > It seems that pkgid is 0x1 here, which is not a problem because
> > it's single socket, but dunno if HP or somebody else couldn't do
> > similar things in an 8-socket system and end up with pkgid > 8.
> >   
> 
> So is this another bogus case?

No, it isn't bogus. It's a quad-core Carrizo APU with its four LAPICs,
but their numbers start from 0x10 rather than 0x00. And AFAIU, the
calculated pkgid vaule will be 1.

If HP or other vendor would do similar thing on an 8-socket system,
the assumption that (pkgid < 8) could no longer hold, even if the CPUs
are completely real.
