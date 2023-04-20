Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA088F68
	for <regressions@lists.linux.dev>; Thu, 20 Apr 2023 19:39:39 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-95316faa3a8so110985366b.2
        for <regressions@lists.linux.dev>; Thu, 20 Apr 2023 12:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1682019577; x=1684611577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HILdVpnxn60sz/1+sruxM2PcPSxjEhfqFGF21BfXJgw=;
        b=Z0Lfl9rFznZK4+XC+YnJ7OGtVVP93xBVIgp8L5wPabiyMHayvEMcGTYqR1eg349HZ8
         m/QouQ721ax/Eo9Xrn038i8idFWh6bm/Q1FKDYnjfWbxh+J4nB015gI0zdPunVznSNzb
         LhsuFG6RmoMIpiTDav3CJhrMXYmFkjdfKh0ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682019577; x=1684611577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HILdVpnxn60sz/1+sruxM2PcPSxjEhfqFGF21BfXJgw=;
        b=G/EdOwCUW7hYZnQFYG4lt1+UjfQIdJ5PRTwZZdG8JLwOCAVHLVKuoLrDVqMNS4yoYj
         AJyr6TOVLxbre85zemVS7cLCaWqCv5ZLDfMu4Tad/I4jREdUdMP6d4fKTAOuj3W/Tg0e
         ICZk3jFf1SVhmGP7/i8xyoOhOltFclKDW3l9EeUnbhNNONHnK+YfGG0S6AINT1RbLZ9/
         5l+A4O52u+Wel/73wyRKaYo724cf4w905tZL6iY60PMsvKXOMGnlJriaLpD2It6AvsX4
         eB+0m42HKRfmVam/s5HDrI8iLDSR3lGMgjoISrVUVNL+xDGRyXXBhEof6QdiGKKfcy9F
         7F+Q==
X-Gm-Message-State: AAQBX9ekBFFFvbOxO1Mmn7IymKSgwDgph6cfB40sBoUj++WRD7hhzCkY
	v2nTbHsHxa8irZsYE8zCo9ySU2yhkbQzMhRn+VGKtw==
X-Google-Smtp-Source: AKy350ZXmbgl0VtUNC+tlikqJPlYJ3twwxD2z4YrY9LoRMbjSYvr9rBVZneClfP055/kH3idGCcIdg==
X-Received: by 2002:a17:907:2907:b0:953:93ab:50cf with SMTP id eq7-20020a170907290700b0095393ab50cfmr24392ejc.70.1682019577168;
        Thu, 20 Apr 2023 12:39:37 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id r20-20020a170906705400b0094f05fee9d3sm1064752ejj.211.2023.04.20.12.39.36
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 12:39:36 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5052caa1e32so1306279a12.2
        for <regressions@lists.linux.dev>; Thu, 20 Apr 2023 12:39:36 -0700 (PDT)
X-Received: by 2002:aa7:cc98:0:b0:506:b120:8df2 with SMTP id
 p24-20020aa7cc98000000b00506b1208df2mr2667877edt.12.1682019575666; Thu, 20
 Apr 2023 12:39:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <168166781352.1843526.278570500979918184@leemhuis.info>
 <CAHk-=wjQaxmXTR68VnEJvLgB=H2agMTrrF4EXkXT4Hbdf2ZuMQ@mail.gmail.com>
 <20230418182036.GS19619@suse.cz> <CAHk-=wjL7GG9s9Y2+u2725M+Ru=bUXnzOnXRwoSktY0fVdhhzw@mail.gmail.com>
 <20230420190239.GX19619@suse.cz>
In-Reply-To: <20230420190239.GX19619@suse.cz>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 20 Apr 2023 12:39:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgwWaoeL-PGSWbfAHipORoiiQN0CJEehQyTt8NB+WRKgg@mail.gmail.com>
Message-ID: <CAHk-=wgwWaoeL-PGSWbfAHipORoiiQN0CJEehQyTt8NB+WRKgg@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2023-04-16]
To: dsterba@suse.cz
Cc: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>, Rafael Wysocki <rafael@kernel.org>, 
	David Sterba <dsterba@suse.com>, LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2023 at 12:02=E2=80=AFPM David Sterba <dsterba@suse.cz> wro=
te:
>
> No, the main concern is if discard works without destroying data,

I actually ended up googling it, and I'm a lot less worried now,
because at least according to my limited searching it seems like
Windows enables trim by default at least since Win10.

Of course, I also found some conflicting statements claiming that USB
drives aren't considered SSDs, so who knows. But it does seem like
probably new hardware ends up getting tested for trim, and the bad
situation is likely really limited to only the bad old days.

So together with Fedora having apparently enabled timed auto-trimming
for some time, I guess I will just have to believe that the world has
turned into a less dark and scary place than I thought it was.

Knock wood.

            Linus
