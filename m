Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D9D173
	for <regressions@lists.linux.dev>; Tue, 25 Jan 2022 08:31:09 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id b37so18284792uad.12
        for <regressions@lists.linux.dev>; Tue, 25 Jan 2022 00:31:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pLI0NpGLcGeDoF34x+JYc6mPOV18pDeJSnyNKlPba8Q=;
        b=XHMOTyyg/9pREw2XaBJl1SzRqJqDSf8sS73/9A+zdf5xyy/lMAdcDxF7hgPxffmRhB
         nTwi6AREqEv9UXp0AXK6GkzE2EXFw0vPYz/fS772fB86hGjx9s9IUK5hmu6FC4IMnNc4
         ykwqAMyTUsVAKQupm80kMLNzKkLOiBbgTIRbmqXxnuwE7irvXbevyGNX3sEZwqjQoTnK
         V3xdKDQCHvmpZG+WfN+GVUJmk0xPcwoPaGBA0spXw52d262LIdYawgFh9dP4usbd6rjV
         kcBDnCK4zjQ5+1PLdDmp3HuZq+SBnrKlHslXiztGPrwST1F8VyOmHUlf6gB4wT5WCSl6
         YVtg==
X-Gm-Message-State: AOAM530U1hf/bHECrlh4YS4EkH0tWNADu2WfC7HUV8rwQyBpQz4nuqag
	76PD3CeLS8JAV4ltyiAsrcNp8avHxuodyw==
X-Google-Smtp-Source: ABdhPJxx0BkTmWQnVEvsyZBNR17P/cIo8uqCi2d4oUMSMH50FBEz7OKf+bsj7GLBaALiIao3KQrtCQ==
X-Received: by 2002:a05:6102:c8e:: with SMTP id f14mr7024434vst.57.1643099468792;
        Tue, 25 Jan 2022 00:31:08 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id w124sm2954417vke.20.2022.01.25.00.31.08
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jan 2022 00:31:08 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id f24so35870406uab.11
        for <regressions@lists.linux.dev>; Tue, 25 Jan 2022 00:31:08 -0800 (PST)
X-Received: by 2002:a67:c18e:: with SMTP id h14mr3289857vsj.5.1643099467906;
 Tue, 25 Jan 2022 00:31:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220124210319.325512-1-deller@gmx.de>
In-Reply-To: <20220124210319.325512-1-deller@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Jan 2022 09:30:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5m2z1FmYi2-+rwpr4xc8F_V4TivKcddzA6oVReUijOQ@mail.gmail.com>
Message-ID: <CAMuHMdU5m2z1FmYi2-+rwpr4xc8F_V4TivKcddzA6oVReUijOQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix regression introduced by disabling accelerated
 scrolling in fbcon
To: Helge Deller <deller@gmx.de>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>, Javier Martinez Canillas <javierm@redhat.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Sven Schnelle <svens@stackframe.org>, Claudio Suarez <cssk@net-c.es>, Pavel Machek <pavel@ucw.cz>, 
	Tomi Valkeinen <tomi.valkeinen@ti.com>, Ilia Mirkin <imirkin@alum.mit.edu>, 
	Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Cc regressions

On Mon, Jan 24, 2022 at 10:04 PM Helge Deller <deller@gmx.de> wrote:
> This series reverts two patches which disabled scrolling acceleration in
> fbcon/fbdev. Those patches introduced a regression for fbdev-supported graphic
> cards because of the performance penalty by doing screen scrolling by software
> instead of using existing 2D hardware acceleration.

In the mean time, a userspace regression has been reported, too:
https://lwn.net/Articles/882054/
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=988039

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
