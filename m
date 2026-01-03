Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E06290F
	for <regressions@lists.linux.dev>; Sat,  3 Jan 2026 11:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767440033; cv=none; b=nIk1bNgEiVpSne7lJZOFL7vxDdufEtZ/3oVXwhvTi252Kj1Bj9Hh8JMWFIWAjlPVg2fk3uJHvq1TGirzsXm43FxHKte2gxu8Ek+vudDs8OgVOUDeqMdWdVWLTjotfhrfHcJRiGWsrVa5Kk0j/tqfeIT7TK8GEn4yuhMa8Kx9ZFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767440033; c=relaxed/simple;
	bh=R29kdBhr4Ys/fp6QB97hNwawADUCldVF5jOA/zcRW9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCTTJCFVkwVkPBk6YE29NkzoD9CAUs6tsJDifDAK5EEjA95IXN7p6ftBlfZRPTCfd2SCO78lNvz2ufo+V2uWeHLGjrIJ6FtYio3NoNSS04PPBeQkY8jOJjM50eBHMxaMgp58Q020a4EJH7lor8eqB86U2MwXWPvvphag5xcxMKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWZTdBIr; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWZTdBIr"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47797676c62so12114015e9.1
        for <regressions@lists.linux.dev>; Sat, 03 Jan 2026 03:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767440030; x=1768044830; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ufcefJVsovNbptadQDCIANuVGLP5nh4jVV/94BHGrao=;
        b=cWZTdBIrGIM2TpsixlSNW6CBvLfgj/T7sG6fDR3+Uc8H0O1e5pu5wSaF2t8wH+sZlr
         d4Y9PGIVrJje9NuL7HzFWXgjs14LlVcIMiF66UQ5xHkJHnqffi9dj7aIimcjq8U3zIKi
         bixMaS3YZcFj+Fvsd1SWmXUwAXBKaQODNqoLYQI9TFzj6l81itCvbASFT/99Krpp9NKx
         mFyR85IWp2yl/iScBvvQ4enkD/NJrZOUqNfPaz4lRxHo5Pf5xDkShcFCKYB+Kyj2iayR
         T+sLCR7b7MgYFucIHupFT93RbHjC20P4wZ2ZlBRSGz5z73MdhKplkpyoszQD5EzWsRPG
         /TfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767440030; x=1768044830;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ufcefJVsovNbptadQDCIANuVGLP5nh4jVV/94BHGrao=;
        b=VFzU8Q0rOyW4qPdBjDofP0pIPjnh4WWt5V5byi0qLWrkmcdtPY4AJDj4jyv9s/O/jm
         DKOWxN1BGU0H/DR56HCqJRn4GFoTOKFHkJ3fvsw37sTYZLJjgPcZ+/dj++eSZDNIafSG
         GnxAG6xGh51dfTMKZ6qQPtbVDDcwrKbfuLzb1u/xipZK++mqInNe5mce6HKvRYwtpo6I
         fevXAnw7oN1S2HpzfSP2445w2hLihWcOp16vLae5tsEcHKic8EErKsR5FvBShXWlzQmM
         jZd1I+kgIk+U+rOROcRiTyqIT4MbTzsAvuD1kHakY+2HYpX9qrXSGg4jEuq3PQTr0gRn
         Zn0g==
X-Forwarded-Encrypted: i=1; AJvYcCWkHZS0Tsg2bs7AqLCeYHYPOt7xa11n/PBJe1LmstR2GRi2klIRdSpGC5q/RL9ErjG9QWlzLFWwzm6Thg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCuuelLo4nnebX23Af0x4fRu17asi+va7+SU1PNJmlFOeG+jpM
	bZO636pMXL3Qlylxw0mmNY4iM4uSreIVOJr/Z1vdJYc+7OU3qU4LMq5N
X-Gm-Gg: AY/fxX7issWbuVHv3yV97F5eEntNAGSQuvHGdTfvTOCIng1XNt7RgroXOzBR5NMEonW
	UPw9Kh53dr5mLM1wJDop38TnuzlxFnjJ3ePl/nVRmHyJDO1tUkdQdOshInGRB7VQVpub/SPrGUk
	PiXZFBEJJ1REV08DTJu3cJdwn6m9yltEEWT/QfzCbZw9ZztdFxlUfOEzimsaZwLq+8N/nV8wWYz
	Qu/LHTsFGXKSbB6FKlV2SpzV83EhYgMY569f8DA7wJ5o/ixoCdM1dm0FaBJwAxea5sJM16b5Qjz
	IDjPX/Wn0mKnuctsGRp++3RTE/fyrc4nvbMr6I5t6sJBn/SYPFJy5/CbN80sNZG6sWWC7Cn3V+g
	9G3RqnIsd7qyW8JYqXRk3nP5Kg4fpk8t+ENMolNZMTLYn7oAkEtPmKT5XkB+3V/Y6yM6fEcjoIu
	SwjMYJmFCJWtqW3cR+07ytHQ==
X-Google-Smtp-Source: AGHT+IH3pBngYGrXfax3dXFTdYtopPEIucZI6Xy95b+JVFKyiDopAVgfxaAI2m507ZcWZ3YvIO71Ow==
X-Received: by 2002:a05:6000:4020:b0:429:bde0:1da8 with SMTP id ffacd0b85a97d-4324e70cadcmr33580502f8f.7.1767440029849;
        Sat, 03 Jan 2026 03:33:49 -0800 (PST)
Received: from debian ([88.97.178.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2a94sm89501609f8f.43.2026.01.03.03.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 03:33:49 -0800 (PST)
Date: Sat, 3 Jan 2026 11:33:47 +0000
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>,
	Salvatore Bonaccorso <carnil@debian.org>
Cc: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	regressions@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: BUG: kernel NULL pointer dereference, address: 0000000000000000
Message-ID: <aVj-mz8vaw53TWtX@debian>
References: <6ba903ad-9897-42bb-8c2d-337385cc3746@molgen.mpg.de>
 <db387081-345f-423a-a0ff-e13f3bec2d51@molgen.mpg.de>
 <CADVatmM_mRnkDX=hpUjbyKkZnGynxJfRSujGxm2LaWWMEL_2ew@mail.gmail.com>
 <ef9223ee-0a4e-468c-bfd0-0cf190d262f1@molgen.mpg.de>
 <aVgjpWaIRkerdgCa@eldamar.lan>
 <49cdd663-bcbd-48b4-ac38-77ce94ef0c8d@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49cdd663-bcbd-48b4-ac38-77ce94ef0c8d@molgen.mpg.de>

On Sat, Jan 03, 2026 at 12:01:19PM +0600, Paul Menzel wrote:
> Dear Salvatore,
> 
> 
> Thank you for the follow-up.
> 
> Am 03.01.26 um 01:59 schrieb Salvatore Bonaccorso:
> 
> > On Mon, Dec 01, 2025 at 05:05:59PM +0100, Paul Menzel wrote:
> 
> > > Am 01.12.25 um 14:25 schrieb Sudip Mukherjee:
> > > > On Thu, 27 Nov 2025 at 22:55, Paul Menzel wrote:
> > > 
> > > > > Am 27.11.25 um 19:51 schrieb Paul Menzel:
> > > > > 
> > > > > > Unfortunately, not reproducible, but starting with Linux 6.18-rc7, I got
> > > > > > the oops below *once*:

<snip>

> > 
> > https://bugs.debian.org/1124075
> 
> This is
> 
> AMD AM5 ASUS ROG STRIX B650-A GAMING WIFI, BIOS 3067 12/10/2024
> 
> > https://bugs.debian.org/1124463
> 
> This is
> 
> Dell Latitude E5470/0VHKV0, BIOS 1.34.3 11/20/2022
> 
> > Does it make a difference to cold-boot or reboot into the system?
> 
> I only did cold boots, and I am not able to reproduce it anymore, and wrote
> it off to some hardware issue – despite the system working fine otherwise.
> 
> I am adding the x86 folks, and regression lists.

Thanks Salvatore for the Debian bug links.

I had been trying to reproduce this but have not seen it on my machine so far.

But looking at the traces from the Debian bugs and the trace from Paul, my best
guess is that its happening because the low level driver, parport_pc in these
cases, has not completed setting up the hardware.

When 'lp' starts registering, parport driver will check if there is any port,
if no ports are found then it will try to load the low level module.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/parport/share.c?h=v6.19-rc3#n198

As mentioned in the comment request_module() is not trying to load a real module
and it depends on the alias. Also, mentioned in the Documentation.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/admin-guide/parport.rst?h=v6.19-rc3#n45

I am not sure why the problem is seen now, but is it possible to test the
below diff please and see if that fixes the issue.

diff --git a/drivers/parport/share.c b/drivers/parport/share.c
index 427abdf3c4c4a..8f45daf7b3825 100644
--- a/drivers/parport/share.c
+++ b/drivers/parport/share.c
@@ -287,8 +287,16 @@ int __parport_register_driver(struct parport_driver *drv, struct module *owner,
         */
        ret = bus_for_each_dev(&parport_bus_type, NULL, NULL,
                               port_detect);
-       if (!ret)
+
+       /* Return if no port has been found. The driver has been
+        * registered, so whenever a new port registers
+        * attach_driver_chain() will be called which will then check
+        * all registered drivers.
+        */
+       if (!ret) {
                get_lowlevel_driver();
+               return 0;
+       }
 
        mutex_lock(&registration_lock);
        if (drv->match_port)


-- 
Regards
Sudip
