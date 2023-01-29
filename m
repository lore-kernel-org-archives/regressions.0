Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DB62FB2
	for <regressions@lists.linux.dev>; Sun, 29 Jan 2023 19:32:35 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id ud5so26425667ejc.4
        for <regressions@lists.linux.dev>; Sun, 29 Jan 2023 11:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=731c7w/fO+KMHGo0w8O/rvDRhDiYETDvCd48ycqNrIY=;
        b=U6OH8YqWvPH8uv2AxM2xB52mih92LQ7Afl+E2hHmSDXDqLOLgW5OulvgkmnZuIpU+k
         Pjzj/Xq45PGuLPJqJVAH0IxNpST/xk98h2JKXncEiOO7zAmzeE1sIZOUrgLXVO3ZL2tX
         PX8vjC98zcRUeZ/sp0spcJVMd2QMrQSnpF/2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=731c7w/fO+KMHGo0w8O/rvDRhDiYETDvCd48ycqNrIY=;
        b=QpNZJtFbokAgQOK8lkvYocKg1ewasEcF4VqgRROhc/b+1MessJCqwL00q8G4tzc+Yu
         +IpVWbUeTiqdBbBnNury3tZP//Mvte3GpzingohPIS9ptOuDRmvk9pR/Z5ZHk2HA+DC8
         9stW3A+AE8GygSMCpHCwPj+0dWFdIQY6VJbhSaiLdCadLWRO30bOR2v+HqnNA8VWjRoo
         wYbxh/lE+xnB1ZU2hvDeeMPk4y+s6076IyPVIDuInKHVrobnSsBIY8p9VCJgrtlCcgcX
         ndw0fE6UkWnlMpELfE89CJ4AYqi7govKT1jqlDMD3Ab2ibvcaQXyciKNkpWzWFj4yPdK
         SAUg==
X-Gm-Message-State: AO0yUKVMw7MJnJfz7V5IbIPlYYx8m9wYiH5+PEHUtFJA5N4CEkwXjKho
	oWU3WvHhX/CO4f7ocYIIALF06eczQBBOc3Pbv/Y=
X-Google-Smtp-Source: AK7set/Gc8BwSz+dFpSBeqTnSdFkcQ76EeB1/fhS3fFR8E6LAJXQ/iVQ+kILH451aX5z3QpJp1diGA==
X-Received: by 2002:a17:906:d8c4:b0:87f:546d:7cb5 with SMTP id re4-20020a170906d8c400b0087f546d7cb5mr8021127ejb.37.1675020753401;
        Sun, 29 Jan 2023 11:32:33 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id d27-20020a170906041b00b00887f6c39ac0sm874860eja.98.2023.01.29.11.32.32
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jan 2023 11:32:32 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id m2so25939226ejb.8
        for <regressions@lists.linux.dev>; Sun, 29 Jan 2023 11:32:32 -0800 (PST)
X-Received: by 2002:a17:906:1e94:b0:889:2908:a9c8 with SMTP id
 e20-20020a1709061e9400b008892908a9c8mr81182ejj.82.1675020752273; Sun, 29 Jan
 2023 11:32:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <167501403214.1314424.14370223374691112185@leemhuis.info>
In-Reply-To: <167501403214.1314424.14370223374691112185@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 29 Jan 2023 11:32:15 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgnBBJ7hDSz5T+2FMF0JhE1Jmf6=tZEytQ6n1jZ4m2s=w@mail.gmail.com>
Message-ID: <CAHk-=wgnBBJ7hDSz5T+2FMF0JhE1Jmf6=tZEytQ6n1jZ4m2s=w@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2023-01-29]
To: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 29, 2023 at 9:42 AM Regzbot (on behalf of Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> * Andrew afaics didn=E2=80=99t sent a revert[1] from Vlastimir your way

Ok, I applied this one as tiny and clear and hitting actual user loads.

> * A fix[1] for a stack_depot/kmemleak issue is in next for a while alread=
y too[2]

This one I left alone, since it's a bit more involved and the use-case
is more esoteric too.

> * a fix for a spi issue[1] is also sitting in next for two weeks now :-( =
#sigh

Leaving this alone too for now.

And in other news, the input regression revert you mentioned earlier
got pulled this morning.

               Linus
