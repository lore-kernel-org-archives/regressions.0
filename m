Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640C7185B
	for <regressions@lists.linux.dev>; Mon, 21 Aug 2023 09:45:47 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2b72161c6e9so48215331fa.0
        for <regressions@lists.linux.dev>; Mon, 21 Aug 2023 02:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692611145; x=1693215945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXrzJekWebthka+oRqCLeF2NbSrhuQVkBUewP5jY82E=;
        b=ESUb5mt0pif/4/0ee8nGER4MumOqtbcKsk+y/YK4wWg8rNq/6Zbv3q014Tziv2SdtD
         bl4s+RTSBPMXAVKEk4dpGwJpXvQTm78uZhPftx22qdsF1BO2fsTH1wJDTICNmn44dR3E
         qHdtXJWXl9wfr/khAudxPtn+qzgp3nLtV2yef0DJq87C248AxvFQFbEZY8JcZ/tuSXUd
         Rl1ioo6qaEWI8UnzblQhGiqi0YzCxjAoJqeNEhvb0hshxyFdF8Fzm5ZXQjcSlqAHnUZE
         CraRLCsZbpTVPJ9XnwjPe8jFAD0fyadOmSP3As8MJxZ4wUmGwVWklXMQQWNmtwLOmvof
         tTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692611145; x=1693215945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YXrzJekWebthka+oRqCLeF2NbSrhuQVkBUewP5jY82E=;
        b=JZDDlIqWNcg4U9upMqMcGk2jLkyG0d1d8/TcAbChn4ZNcbHQIBLkVkZHedZtAlNulx
         TCSkov/nYUjgQv0C/4PBaRFb8bFb632/euv2QPyETeCIRP63rDaS13TjMdgSUWW2BS+b
         h/i976hSNceT26JB1SYaBaXViVBR7F3W0YI2/Vrsic5qPVIP478ftcjDABfYmIMLT14x
         PB0Y8OX9dr+7M/SCRJXbxyJ3dgb9a3j8JpsVJys1y7SeTaB9Xk+xgZ+FyfNlrzbLHzkO
         Qd0+EUGdIJajkl6K+2Jui8m3EbTaPo9m/CwvAxy/6Ga+Vfsa/A+dDFeibOjvpfbRgBBI
         4Knw==
X-Gm-Message-State: AOJu0YyiyBdocu5IRrKeXbDuFXUTx5rqC17qkqwl4zsFY2iJbCnnsCcY
	qB9NnWO1ltGedLHBpvpCVWubi6gn7P3hhhUHlARLrloZRi6FwA==
X-Google-Smtp-Source: AGHT+IEdM8QVeDFGwcQueS2atSsLxX9mr+uYi4bw6KPAiR9wR139TNuB4GQX211qP2ZEPWfyDqoPhuzw+80uqhQH6Zw=
X-Received: by 2002:a2e:9915:0:b0:2b6:d0c1:7cd0 with SMTP id
 v21-20020a2e9915000000b002b6d0c17cd0mr1993359lji.22.1692611145029; Mon, 21
 Aug 2023 02:45:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+prNOpqd2Tk1tiBAa9MT6ZPxB5gj9ftxOhaZ-u1WEay9H-oHQ@mail.gmail.com>
 <20230815053132.GB22301@1wt.eu> <CA+prNOrUVWM9-vozUZyW49-m=qFWZR3JAtikZb4T1EimV0ZCDw@mail.gmail.com>
 <CAHk-=wgDbr7dw0GP4zEkPu5X2mME3YH9t0+cP8Avs3m0KZxbCQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgDbr7dw0GP4zEkPu5X2mME3YH9t0+cP8Avs3m0KZxbCQ@mail.gmail.com>
From: Xuancong Wang <xuancong84@gmail.com>
Date: Mon, 21 Aug 2023 17:45:38 +0800
Message-ID: <CA+prNOpbbiLEDrvVLZ_9AHpyJPV8z3ge1aRX58ri2PPTjDJGGw@mail.gmail.com>
Subject: Re: A small bug in file access control that all have neglected
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Willy Tarreau <w@1wt.eu>, security@kernel.org, stable@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Torvalds for your clear-cut answer, I really appreciate that.

On another hand, I would like to suggest that Linux files should have
an additional permission bit to be granted arbitrary attributes
access, especially for the atime, ctime and mtime. The reason is
because in production data pipeline, we often need multiple people to
get/set the same file's modification times arbitrarily (e.g., set an
output file's mtime according to the input file for incremental
processing), and this process is managed by several people. So now, we
have to run our data processing pipeline as root which is risky and
undesirable.

This can be implemented either:
- as a single bit in file attributes along with the 7777 (i.e., setUID
bit, setGID bit, sticky bit, user-3-bits, group-3-bits,
others-3-bits), I would call it group-attribute-bit to allow users in
the same group to modify its timestamp arbitrarily.
or
- as an extra bit in user/group/other, so that it become 7FFF (it is
nice to have 4-bits for user/group/other, because 4 bits make up for
one hexadecimal digit=F0=9F=98=81)

Thank you very much for your consideration!

Cheers,
Xuancong


On Tue, Aug 15, 2023 at 2:29=E2=80=AFPM Linus Torvalds
<torvalds@linuxfoundation.org> wrote:
>
> On Tue, 15 Aug 2023 at 06:11, Xuancong Wang <xuancong84@gmail.com> wrote:
> >
> > Yes, by "full access", I mean `chmod 777`. You can easily reproduce
> > this bug on any Linux machine by typing the following commands:
>
> This is how things are supposed to work. The 0777 permissions mean
> that you can read, write and execute the file. They do not mean that
> you own the file.
>
> As a non-owner, you can set the access and modification times  the
> same way you could by just reading and writing to the file. So if you
> set mtime, you have to set ctime ("change time") too.
>
> To actually change times arbitrarily and with other patterns, you need
> to actually own the file.
>
>              Linus
