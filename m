Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029E2623
	for <regressions@lists.linux.dev>; Tue, 28 Feb 2023 02:40:48 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id i34so34079003eda.7
        for <regressions@lists.linux.dev>; Mon, 27 Feb 2023 18:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1677552046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S33amPXBgEdvAj5aotTxFER/po/FAxTdpekQddcRdP0=;
        b=YxKbnUWTkfpWeNciGJkOdlwppOPzA7xvnBrKyFYmchwEuCkUceKSBjsY/taOKRFXAX
         ZPUXHDflYsjqOhyR7qlNe3t+PNFcdFVoHxqRDCYsxYvSJhx6pOzGIbnu2TsbiNhR8Jt0
         gyDFTIxOxiTe7XKoVjUFQ/Pow7zfF4xKSe6DE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677552046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S33amPXBgEdvAj5aotTxFER/po/FAxTdpekQddcRdP0=;
        b=lNBt4ZXR0A350rSTv4DgII3Ml9+o8NwQnLrdIdRhqfJTEEafs1bIbhOLdDj2hM81ek
         411E/QxJVR8LU8L4Az0B/PAwg85RIdmOBQ4Vzx13ybimxNn8nDdYCK82b/GlFR9deOGY
         HS0QRpzrTiw1P9QxsR/JXn1l3FfSKgecKKkRZ5McBr2a1IocLcCXn9Awi/Do4gAjcWYa
         s5/vMMAGi5vretvsGrJ1KY9Ys5DGo+kHE2eAjCuey1tVirdUuPUzMefjBvClKgIkahxR
         TkbQDdJA+aplXqMx7LUhQwmoMp1QopMLY2zDKRqy1i/aBlBBuZK+aMrX+P6iS36efHgH
         ntyA==
X-Gm-Message-State: AO0yUKWxPNtQ9YTPrYLHt5VcXque2HNW244VU83L5wQEsjUDsWfZEqTJ
	Pvo4BlOcEtH1M+zEt3zGkwAjR/pV+yfEUMeJFUQ=
X-Google-Smtp-Source: AK7set962pks1RmNAJ95e4cWdW+bioqM51a/XX4W7cexgoHQUzWRJdxootgriPr9Rzcc6iVHp4Y/Zw==
X-Received: by 2002:aa7:c98c:0:b0:4ac:bdf3:36ca with SMTP id c12-20020aa7c98c000000b004acbdf336camr1833305edt.10.1677552046702;
        Mon, 27 Feb 2023 18:40:46 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id y23-20020a50ce17000000b004af6163f845sm3777504edi.28.2023.02.27.18.40.45
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 18:40:45 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id cq23so34221258edb.1
        for <regressions@lists.linux.dev>; Mon, 27 Feb 2023 18:40:45 -0800 (PST)
X-Received: by 2002:a17:906:79a:b0:8b8:aef3:f2a9 with SMTP id
 l26-20020a170906079a00b008b8aef3f2a9mr413714ejc.0.1677552045260; Mon, 27 Feb
 2023 18:40:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1677529301-19530-1-git-send-email-george.kennedy@oracle.com>
 <face2b1b-0f2e-4a79-a71b-79681fc56273@t-8ch.de> <CAHk-=whxC0ob3f--B-igBp34ujA5PZQMcTnDQ8Zh8HA7+ZbeWg@mail.gmail.com>
 <64981d94-d00c-4b31-9063-43ad0a384bde@t-8ch.de>
In-Reply-To: <64981d94-d00c-4b31-9063-43ad0a384bde@t-8ch.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Feb 2023 18:40:28 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi3KimdZnsU5j7fPgPCpDj3QaZvmu5CXRsAE=NiOjmAXw@mail.gmail.com>
Message-ID: <CAHk-=wi3KimdZnsU5j7fPgPCpDj3QaZvmu5CXRsAE=NiOjmAXw@mail.gmail.com>
Subject: Re: [PATCH v2] vc_screen: modify vcs_size() handling in vcs_read()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: George Kennedy <george.kennedy@oracle.com>, jirislaby@kernel.org, 
	gregkh@linuxfoundation.org, sfr@canb.auug.org.au, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 6:18=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
>
> Tested-By: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>
> (Or feel free to use my patch from above and fixup the goto/break line)

Done.

              Linus
