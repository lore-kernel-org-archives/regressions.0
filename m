Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECA529CA
	for <regressions@lists.linux.dev>; Wed, 26 Jan 2022 14:28:34 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id w21so43137247uan.7
        for <regressions@lists.linux.dev>; Wed, 26 Jan 2022 06:28:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fHOCyGn2OpYXHR2TSZ46or0oGciq1pUeUpvpqS2jqZ4=;
        b=7Wn2R7dec5CzTA04lXwUHpi9EXtK0wTJrSI/bL2MZp2+EhjxTPqJp8Tcm9XaPp/pEA
         NxXKblDjUCO7NERzKzwKCsEMVCZGB4M8CRumXI0tnIqUde/EXDLMBQdup7YyDFBWFg7U
         W+28M74U3knEEAydzWlks+OLfT4oaO20lElXk0HyKPkWbj+HyN4eDyjG33vjmFK3ov6G
         XYqO045dEiEQSw5T1ufV1tuXwNc5Afg31ndI1HXbAsImj3k0OCmiaP0fCCToMyNSmqA5
         o5/T4zEwrVVigl8YmYsLAnUYQVmUMMZ7bgu26qcVI5+wNN/XQJUbUYS/pcDyGFrUE8Z+
         Ntpg==
X-Gm-Message-State: AOAM530ocC2dLIFwYdMf61rAIyrJZuX29w9i4/W40PmdOOMtAvCWQm+A
	wsF+I7s90MfEXd/1SrRLgJNWu6WNLcHRByhS
X-Google-Smtp-Source: ABdhPJxdAc4Vnxv0/VzpEe+JIo8NOkObBEsMlkweClW9gAwuIwlhTDxlZJ4Wqb3iUt0NLVvQkYxWWw==
X-Received: by 2002:ab0:59ea:: with SMTP id k39mr9473446uad.71.1643207313000;
        Wed, 26 Jan 2022 06:28:33 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id b191sm3961113vkb.32.2022.01.26.06.28.32
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 06:28:32 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id u6so43274536uaq.0
        for <regressions@lists.linux.dev>; Wed, 26 Jan 2022 06:28:32 -0800 (PST)
X-Received: by 2002:a05:6102:34e:: with SMTP id e14mr2620287vsa.68.1643207311974;
 Wed, 26 Jan 2022 06:28:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1643110442.git.linux@leemhuis.info> <f97738d6250050bc982bf2947587f1c73f37446f.1643110442.git.linux@leemhuis.info>
In-Reply-To: <f97738d6250050bc982bf2947587f1c73f37446f.1643110442.git.linux@leemhuis.info>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Jan 2022 15:28:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXRoVt_zRBNvugJjYhJnyYbABeCWv9fFRM0r_=s7FYvJQ@mail.gmail.com>
Message-ID: <CAMuHMdXRoVt_zRBNvugJjYhJnyYbABeCWv9fFRM0r_=s7FYvJQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] docs: add a document about regression handling
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, workflows@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, regressions@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Thorsten,

On Tue, Jan 25, 2022 at 5:45 PM Thorsten Leemhuis <linux@leemhuis.info> wrote:
> +How to create a configuration similar to the one of an older kernel?
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Start a known-good kernel and configure the newer Linux version with ``make
> +olddefconfig``. This makes the kernel's build scripts pick up the configuration
> +file (the `.config` file) from the running kernel as base for the new one you
> +are about to compile; afterwards they set all new configuration options to their
> +default value, which should disable new features that might cause regressions.

Doing so may actually cause mutations to appear in your .config
when going back and forth (i.e. when bisecting), interfering with
the bisection process.

To avoid that, I usually start bisecting with
"cp .config <src>/arch/<arch>/configs/bisect_defconfig", and use
"make bisect_defconfig" in every bisection step. That way all steps
are reproducible, and unaffected by config mutations.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
