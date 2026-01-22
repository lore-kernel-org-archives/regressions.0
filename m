Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C7C387572
	for <regressions@lists.linux.dev>; Thu, 22 Jan 2026 10:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769076890; cv=none; b=HDgIkU7zPIElZS8Hwybzo0o1DeCF6IIAgRKbaQwQ47Og7YutGvyDxS+5VLZD90UFPq3K+EoqmyZFQslMPgQWfVzn5vZRIgS99mSZUdJ2B1MClVb58YsMcGDIjxezm8dFrcVOkU5YND6G3jGOaZjWYB1PcQnMNTY5PQWkbYwE5xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769076890; c=relaxed/simple;
	bh=Yz1o2to9E6jEtGsR9kzwAPIrx7ZLI0brL/r42w4JNsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5euO/VCrIwLsi1daQzVlOYToTvQr1X2DCDiwFaJGAOseXAqI428swUhCSOkyuJPdeh96Ib6Q95Lkb8yGAIcSVUHszLgBEJ0IVYhlxiBVmpohIKHo7pHKEvVR0FyHtao4/JhfZgLex69QvqOnkBpjpss4YxZ6rxMy/KLewphpfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACLknET0; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACLknET0"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59dcd9b89ecso973995e87.1
        for <regressions@lists.linux.dev>; Thu, 22 Jan 2026 02:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769076885; x=1769681685; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eALT1Ba+MHNBlVAy5iNIf3AX4qDAc1KcwVERZT6e1Wo=;
        b=ACLknET0+3pCj5QrQS6zypbrI8lkK6xBlxd0OvZeKwRPIRsXJNJ6MWYgNatzy7v1WD
         hiHtr0Ewo9zLxMCBrRk8p0OOFxJMKOb8hAm7vJmLyGCZLaG0ojLu1ujYfkILCGa/WYM2
         cYx5YQzFXxfdvruaOc8+LKmX3UlAzcykuMzZq2I6ubAOfSRvOWgEs9tNB/Uc5ltZnbAj
         mDz5AlzQ6E5Euhacs/hZP7VPjZNm6LQbU+ZUr0PUyVB0h5ZTlvBFIJ2844MIz8esmRmV
         VpjQP5j24rxqmo293LPwPKtLZRKyTqy38f8hG3XaVuMglGowGCTxBRQO8EkokSt5qkcx
         HzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769076885; x=1769681685;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eALT1Ba+MHNBlVAy5iNIf3AX4qDAc1KcwVERZT6e1Wo=;
        b=grCQZ5rRyZng+16EeaAdS06jRCImEbbZOgrNKGKbctd7nNni7CKjGluMQAp5RARkrd
         fOh7UA+/Na/1FUB4nLox2KLDMjWKYKylqJWxnROZKJ2xmqsoqEJZVa2F1LGNZtiUzJBL
         jBFI6xoVS6rmzDHm27A5tvYDlV85M9eD5IwuiV8gxsrNuvoPmQAeIxG004ZQ0ZhQRH14
         ptCY4icJPI6+bWut/i930q9sR1EAV1U40m1Ylwi6shMGsQ1m837yigvZcyettwo1P2Mg
         66fNwdA2nslLYqmzAEQZTdZHsGB71jvAr7egMyUoTgHiPq7T0HZgedAwmjwSlZkPwfti
         G8rA==
X-Forwarded-Encrypted: i=1; AJvYcCVUd3KYdtjE/COm1aeb5g0y4wfS4VnuJmHuNO1LJlyNU9Basj2qA2NBmIOcEUjBLavi3/EDPf3eu4fZ9A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwI6D/1O1Q4H4pRLmSrl1Zg17LlrY6aq0woejNQiLVclDvKzLix
	qyEpJFpwT6wIhh+Ub+DnoqGcpaerWekpW07vF+xjgnnV3Wl/oiZj5N5dj9erEm4f
X-Gm-Gg: AZuq6aKNDVJz2hHO0vHmpVX2HaD34p8RXDGXU+xVkzFeqmW0u6rAVgt7+GxBlOwbxVl
	9+/CpjkWZwNKb8YLJmREorpYk+VJWdRSf5R8TKlibId1OiFtIpP6PHfUxSjHQ5Hpv78ZNdL8aDe
	YjzTTsgPedC2wRxuIrDTq43gz/ARf/tvN8FOz2gBeeqTjqaQr6kee1tZMsYbU8yuqJ6qGgfZA9C
	d1H226tHtu7sJ66aegqV3cpC90FUcJ4PK0zy/gRUQ64AMeN1w+m4GdobcEO6e0LCFhSZFyL+S+i
	MrxY+P1u8+0/awbGQHIWskD+QYtXSfPZ2HbKALiUL7kQitADIH/mMotzc1xSJ9yNbmx9gfQBMCG
	dltq4bWxyfPNKTZQQcXupj6TGXL6hRCUD0gpXyuhe8aH14DsJ0a4c7hFM+TNz6+TrKTufTEtHN+
	TvGPMnHFwApYBoenJvdIG1fCaV0K6nukHRcJwip4vsawGG
X-Received: by 2002:a5d:64c4:0:b0:435:9144:13fe with SMTP id ffacd0b85a97d-435a5ff8c0fmr3688943f8f.26.1769070126382;
        Thu, 22 Jan 2026 00:22:06 -0800 (PST)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435924ae723sm16436873f8f.41.2026.01.22.00.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 00:22:05 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 63C17BE2EE7; Thu, 22 Jan 2026 09:22:04 +0100 (CET)
Date: Thu, 22 Jan 2026 09:22:04 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	regressions@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Giuseppe Sacco <eppesuig@debian.org>
Subject: Re: BUG: kernel NULL pointer dereference, address: 0000000000000000
Message-ID: <aXHeLGr1n-W-Ay44@eldamar.lan>
References: <6ba903ad-9897-42bb-8c2d-337385cc3746@molgen.mpg.de>
 <db387081-345f-423a-a0ff-e13f3bec2d51@molgen.mpg.de>
 <CADVatmM_mRnkDX=hpUjbyKkZnGynxJfRSujGxm2LaWWMEL_2ew@mail.gmail.com>
 <ef9223ee-0a4e-468c-bfd0-0cf190d262f1@molgen.mpg.de>
 <aVgjpWaIRkerdgCa@eldamar.lan>
 <49cdd663-bcbd-48b4-ac38-77ce94ef0c8d@molgen.mpg.de>
 <aVj-mz8vaw53TWtX@debian>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aVj-mz8vaw53TWtX@debian>

Hi Sudip,

On Sat, Jan 03, 2026 at 11:33:47AM +0000, Sudip Mukherjee wrote:
> On Sat, Jan 03, 2026 at 12:01:19PM +0600, Paul Menzel wrote:
> > Dear Salvatore,
> > 
> > 
> > Thank you for the follow-up.
> > 
> > Am 03.01.26 um 01:59 schrieb Salvatore Bonaccorso:
> > 
> > > On Mon, Dec 01, 2025 at 05:05:59PM +0100, Paul Menzel wrote:
> > 
> > > > Am 01.12.25 um 14:25 schrieb Sudip Mukherjee:
> > > > > On Thu, 27 Nov 2025 at 22:55, Paul Menzel wrote:
> > > > 
> > > > > > Am 27.11.25 um 19:51 schrieb Paul Menzel:
> > > > > > 
> > > > > > > Unfortunately, not reproducible, but starting with Linux 6.18-rc7, I got
> > > > > > > the oops below *once*:
> 
> <snip>
> 
> > > 
> > > https://bugs.debian.org/1124075
> > 
> > This is
> > 
> > AMD AM5 ASUS ROG STRIX B650-A GAMING WIFI, BIOS 3067 12/10/2024
> > 
> > > https://bugs.debian.org/1124463
> > 
> > This is
> > 
> > Dell Latitude E5470/0VHKV0, BIOS 1.34.3 11/20/2022
> > 
> > > Does it make a difference to cold-boot or reboot into the system?
> > 
> > I only did cold boots, and I am not able to reproduce it anymore, and wrote
> > it off to some hardware issue – despite the system working fine otherwise.
> > 
> > I am adding the x86 folks, and regression lists.
> 
> Thanks Salvatore for the Debian bug links.
> 
> I had been trying to reproduce this but have not seen it on my machine so far.
> 
> But looking at the traces from the Debian bugs and the trace from Paul, my best
> guess is that its happening because the low level driver, parport_pc in these
> cases, has not completed setting up the hardware.
> 
> When 'lp' starts registering, parport driver will check if there is any port,
> if no ports are found then it will try to load the low level module.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/parport/share.c?h=v6.19-rc3#n198
> 
> As mentioned in the comment request_module() is not trying to load a real module
> and it depends on the alias. Also, mentioned in the Documentation.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/admin-guide/parport.rst?h=v6.19-rc3#n45
> 
> I am not sure why the problem is seen now, but is it possible to test the
> below diff please and see if that fixes the issue.
> 
> diff --git a/drivers/parport/share.c b/drivers/parport/share.c
> index 427abdf3c4c4a..8f45daf7b3825 100644
> --- a/drivers/parport/share.c
> +++ b/drivers/parport/share.c
> @@ -287,8 +287,16 @@ int __parport_register_driver(struct parport_driver *drv, struct module *owner,
>          */
>         ret = bus_for_each_dev(&parport_bus_type, NULL, NULL,
>                                port_detect);
> -       if (!ret)
> +
> +       /* Return if no port has been found. The driver has been
> +        * registered, so whenever a new port registers
> +        * attach_driver_chain() will be called which will then check
> +        * all registered drivers.
> +        */
> +       if (!ret) {
>                 get_lowlevel_driver();
> +               return 0;
> +       }
>  
>         mutex_lock(&registration_lock);
>         if (drv->match_port)

We had another report (https://bugs.debian.org/1126128_ but the
problem remains here as well the reproducibilty. Uppon several reboots
only the first one so far showed the problem and was not reproducible
afterwards.

Regards,
Salvatore
