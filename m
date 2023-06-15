Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D95FBE6
	for <regressions@lists.linux.dev>; Thu, 15 Jun 2023 20:09:05 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-340af1a98e2so8757285ab.2
        for <regressions@lists.linux.dev>; Thu, 15 Jun 2023 13:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686859744; x=1689451744;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aTfjaS0IPEiXuHhWcjsCm7WS5mqkvAN6gaYW2Bcvzz4=;
        b=h+xq5Xp+3UTM6suN8+Qq+KZtW+bU2h+APHxtAHxpLNK4Tup1k4d5Rc+y3KOm9vyQ8u
         eArBn+xGv54hcoPy4hCK4pJXfEQRuZn1j5GZCyrrQN+V+6+jxccLFKW2hCORtsNbK9eV
         JHjK0v5mPjGr86qI2H1ehB/CZEDhTbCgrJaiRaFibKDS2sAzdptiZatPCB3zQ6AT9P/m
         Vhc1enraB5xKPAOBTdTHFRcCs07gbVf2BcOTofbqSc4RNzQY8f0MREDVmyA0SbY65eA8
         jmBjziOt+cWCJCPtwrsHthz+jFwu0oWwdvmM0Y4vVBpZRhAZBmwxOoV1eq6ydmnT/hr7
         evBQ==
X-Gm-Message-State: AC+VfDyb4HF6VSYqiey48O273vqNprm6SgE+JNjeLsPWT/ckNYIur09P
	1Rh2pr7XCHn//PSO91aapQ==
X-Google-Smtp-Source: ACHHUZ79LfJp9RkPNTpyZJ5OtyEoIgIYPICSHb+vRi8hTHwBhSpMqkvv/DethS+ipksLPiMZ71fxMQ==
X-Received: by 2002:a92:d3c3:0:b0:340:6984:cc6f with SMTP id c3-20020a92d3c3000000b003406984cc6fmr478157ilh.3.1686859744059;
        Thu, 15 Jun 2023 13:09:04 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id g24-20020a056638061800b004166c24e30dsm5685797jar.32.2023.06.15.13.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 13:09:03 -0700 (PDT)
Received: (nullmailer pid 1586553 invoked by uid 1000);
	Thu, 15 Jun 2023 20:09:01 -0000
Date: Thu, 15 Jun 2023 14:09:01 -0600
From: Rob Herring <robh@kernel.org>
To: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Linux regressions mailing list <regressions@lists.linux.dev>, Salvatore Bonaccorso <carnil@debian.org>, Cyril Brulebois <cyril@debamax.com>, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] fbdev/offb: Update expected device name
Message-ID: <20230615200901.GA1572644-robh@kernel.org>
References: <20230412095509.2196162-1-cyril@debamax.com>
 <20230412095509.2196162-2-cyril@debamax.com>
 <ZDvrY7X9mpJ7WZ3z@eldamar.lan>
 <11b342dc-1a46-d1be-5fdd-c6eee661e15a@leemhuis.info>
 <fe3b90b0-b52f-9677-0245-a201975c3e0c@suse.de>
 <20230615132107.GA9196@kitsune.suse.cz>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230615132107.GA9196@kitsune.suse.cz>

On Thu, Jun 15, 2023 at 03:21:07PM +0200, Michal Suchánek wrote:
> Hello,
> 
> On Thu, Jun 15, 2023 at 03:06:28PM +0200, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 15.06.23 um 15:03 schrieb Linux regression tracking (Thorsten Leemhuis):
> > > On 16.04.23 14:34, Salvatore Bonaccorso wrote:
> > > > 
> > > > On Wed, Apr 12, 2023 at 11:55:08AM +0200, Cyril Brulebois wrote:
> > > > > Since commit 241d2fb56a18 ("of: Make OF framebuffer device names unique"),
> > > > > as spotted by Frédéric Bonnard, the historical "of-display" device is
> > > > > gone: the updated logic creates "of-display.0" instead, then as many
> > > > > "of-display.N" as required.
> > > > > 
> > > > > This means that offb no longer finds the expected device, which prevents
> > > > > the Debian Installer from setting up its interface, at least on ppc64el.
> > > > > 
> > > > > It might be better to iterate on all possible nodes, but updating the
> > > > > hardcoded device from "of-display" to "of-display.0" is confirmed to fix
> > > > > the Debian Installer at the very least.
> 
> At the time this was proposed it was said that "of-display", is wrong,
> and that "of-display.0" must be used for the first device instead, and
> if something breaks an alias can be provided.
> 
> So how does one provide an alias so that offb can find "of-display.0" as
> "of-display"?

I'm not aware of any way. There isn't because device names and paths are 
not considered ABI. There are mechanisms for getting stable class device 
indices (e.g. i2c0, mmcblk0, fb0, fb1, etc.) though not implemented for 
fbN (and please don't add it). 

In any case, this should be an easy fix. Though if "linux,opened" or 
"linux,boot-display" is not set, then you'd still get "of-display.0":

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 78ae84187449..e46482cef9c7 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -553,7 +553,7 @@ static int __init of_platform_default_populate_init(void)
                        if (!of_get_property(node, "linux,opened", NULL) ||
                            !of_get_property(node, "linux,boot-display", NULL))
                                continue;
-                       dev = of_platform_device_create(node, "of-display.0", NULL);
+                       dev = of_platform_device_create(node, "of-display", NULL);
                        of_node_put(node);
                        if (WARN_ON(!dev))
                                return -ENOMEM;
