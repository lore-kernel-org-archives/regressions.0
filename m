Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A62256A
	for <regressions@lists.linux.dev>; Sun,  9 Apr 2023 18:15:52 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id sb12so7820443ejc.11
        for <regressions@lists.linux.dev>; Sun, 09 Apr 2023 11:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1681064150; x=1683656150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XD3RZUvLZHpvi4CUPf6nNhzEy/3YaB47ya/lNwCpn3M=;
        b=aOAtSbHUxCzk/rxXeEt7ujQNOj+vykmabzzyNZ7s60SGTT6kcWaGZKzJ+Lf06UgEAW
         xfOa7B+0cE0k+Dhwo1jd3kNvzSVku+njvlLJWAGx/qbCIXZ9kEMhBf7RtqarxhU2B/+r
         B1dOlQqgV5qFJIXKEUA9EdjmdpXX7JNWWizjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681064150; x=1683656150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XD3RZUvLZHpvi4CUPf6nNhzEy/3YaB47ya/lNwCpn3M=;
        b=CxV2I/z94Yqr6Mgkpq/Is/cNTlLg4SSxi/Buulr9CWEwRfFRZsazc+LkprZcMDN5zg
         rfp9O5feHiIsJvhQh46ua5CaW5JcF2krloljkDjtrQl4wynwQVwS/ka9iYhqXIDBDDnX
         XKyjsE/3TsxU73G0U+StxYU1oChqg/c/4xpbV3JC8Ss+IYaXZEVjN1pQvEWS9CaZz3SF
         PSZWsdDr4VBSGiywclpVg96Jp/YQYlQfxAjDgkEIulwhom2ONXBf0NYeyw+zjp+sAj8F
         K/P6oYm/45rUSzE9Gm/6FckeQKOWmJXgpnt4Xpx3BhGuXKQT3xjT92zKF67E6nPbRTsp
         XNcw==
X-Gm-Message-State: AAQBX9d+9hwI6eTbcTL1zoNmt6h4hHPDuSFr6XIIGOXFeADnlzZK+WZN
	wwyErBrs4mDcbMVe1suo0eNsx2dP1ExNHwxhWd8=
X-Google-Smtp-Source: AKy350YrPh+q74Othku6J7GZzSu0jSYCEkQT/asMgdVt7VKCfQQ6mYNNf15k31hvVSNWLf+ozi81jw==
X-Received: by 2002:a17:907:628c:b0:94a:5602:5d6a with SMTP id nd12-20020a170907628c00b0094a56025d6amr4460606ejc.9.1681064150111;
        Sun, 09 Apr 2023 11:15:50 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id gq10-20020a170906e24a00b0094a962da55dsm57980ejb.195.2023.04.09.11.15.49
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Apr 2023 11:15:49 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-94a4a898649so46222666b.2
        for <regressions@lists.linux.dev>; Sun, 09 Apr 2023 11:15:49 -0700 (PDT)
X-Received: by 2002:a50:a417:0:b0:4fb:482b:f93d with SMTP id
 u23-20020a50a417000000b004fb482bf93dmr3606156edb.2.1681064149030; Sun, 09 Apr
 2023 11:15:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <168106197596.1411382.4633915108737130144@leemhuis.info>
In-Reply-To: <168106197596.1411382.4633915108737130144@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 9 Apr 2023 11:15:32 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgCoBmY2cOdyRFGzEPetAk4ULnd_0N4-OEV6RvrLC3BeA@mail.gmail.com>
Message-ID: <CAHk-=wgCoBmY2cOdyRFGzEPetAk4ULnd_0N4-OEV6RvrLC3BeA@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2023-04-09]
To: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 9, 2023 at 10:41=E2=80=AFAM Regzbot (on behalf of Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> There is another fix for a media regression (that due to backports is
> present is a few stable trees as well) that looks somewhat stalled, but
> I'm not sure if it is ready for merging. If you want to judge yourself,
> take a look at this thread:

Seems to be just a warning in some situations, so not something that
I'd expedite a patch for.

               Linus
