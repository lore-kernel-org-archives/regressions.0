Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FF27E
	for <regressions@lists.linux.dev>; Sat, 21 May 2022 05:01:48 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id f9so18970948ejc.0
        for <regressions@lists.linux.dev>; Fri, 20 May 2022 22:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+JP7eb9X89dzmMi77NTEFpsoLT6OioYPHTkokdTxBHc=;
        b=cQzbMTyiE3pGwpfX4bEhpbYVQq+AvZNw60MIRF7N3gv42F9YVuqaF8j3RZf5Kc2Zx7
         yIFe8S3IfJm4FOgTmmlvYMn2RZTN3K23qkz2gZv8lX4lFoRTrFCZs4AUUAouLsXxSkd3
         dDYwffr2dYvPunf5WQ66AzJlIoyBw7YtXbuUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+JP7eb9X89dzmMi77NTEFpsoLT6OioYPHTkokdTxBHc=;
        b=2etRWCvRaXqvUyUMPnqKQtDik+8M4zpZuuV748AdjLjKkjOuCtQsowg0QzbKJSqG00
         2iSKbvwpiEDh6PTz9jxCdghny4iOzr3paez7YGwXThP+CuzdDcPUwoUPgZh6vXiqZzmi
         DBB84ci+dXcimsg5BKUcmBqInBpLadx5OXWBrTDW+aX83Svs0pQ+UA/9MxR8s/9h0Ea/
         OfJb09wbWXmkDDMumcs29F/Ob+YxFv9k9H50mESjmWz/Q91wHwmMZczdgyqczcjsGp0t
         JYyOjc6Ugdfd6sF5/GGR3stwwP59mrXt1oJ56H8aaep+GygjSECdnviG9qiXzZLLgqVh
         lKlg==
X-Gm-Message-State: AOAM531jRVl2yCKRHB3CcDl+JSJnNSht1E2qiPMExzYOUV2Bib2PNh+V
	/041oOqrqzorlVbwP5MRpyWiqlMNFZlu83Q4
X-Google-Smtp-Source: ABdhPJwnstKGWBxFzJQRbFOSdevgDetRkdtLICV+hmp8wfAH3j4KByYqy51FfN4615g/wArRd/NoIg==
X-Received: by 2002:a17:907:c30f:b0:6fe:5637:c130 with SMTP id tl15-20020a170907c30f00b006fe5637c130mr11224175ejc.270.1653109307028;
        Fri, 20 May 2022 22:01:47 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id u12-20020a50a40c000000b0042acf2cb490sm5323219edb.97.2022.05.20.22.01.45
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 22:01:46 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id k126-20020a1ca184000000b003943fd07180so5291118wme.3
        for <regressions@lists.linux.dev>; Fri, 20 May 2022 22:01:45 -0700 (PDT)
X-Received: by 2002:a05:600c:4f06:b0:394:836b:1552 with SMTP id
 l6-20020a05600c4f0600b00394836b1552mr11323806wmq.145.1653109305450; Fri, 20
 May 2022 22:01:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wi0vqZQUAS67tBsJQW+dtt89m+dqA-Z4bOs8CH-mm8u2w@mail.gmail.com>
 <165209064657.193515.10163777181547077546@leemhuis.info> <CAHk-=wj0gHsG6iw3D8ufptm9a_dvTSqrrOFY9WopObbYbyuwnA@mail.gmail.com>
 <54664f6a-b046-1330-e794-cb533e942a94@redhat.com> <04f2e08c-4c39-16d3-d785-f36494c6256c@redhat.com>
 <063d7fdb-2d4c-5798-773b-d82b4f0e918a@redhat.com>
In-Reply-To: <063d7fdb-2d4c-5798-773b-d82b4f0e918a@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 20 May 2022 19:01:29 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjKtV3mT3S=vxgqe__MUzxRrZ7=fopKQtTKOeQJAVyoUQ@mail.gmail.com>
Message-ID: <CAHk-=wjKtV3mT3S=vxgqe__MUzxRrZ7=fopKQtTKOeQJAVyoUQ@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2022-05-09] (was: Linux 5.18-rc6)
To: Hans de Goede <hdegoede@redhat.com>
Cc: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 19, 2022 at 6:10 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Note this is not part of any pending drm-fixes* pull-reqs yet though.

It has now hit my tree as part of Dave's drm pull today.

Will go out after the usual basic build test.

               Linus
