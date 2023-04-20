Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5EE944E
	for <regressions@lists.linux.dev>; Thu, 20 Apr 2023 22:27:29 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-94ed7e49541so114204566b.1
        for <regressions@lists.linux.dev>; Thu, 20 Apr 2023 15:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1682029647; x=1684621647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o31TJ5tZoCsBlp2o0xbjnltm9BzQDN1XsD84HTTJdiE=;
        b=gH17N6HjtfHWN3S390MXhVbuk2MCZdw26bMFlZMahYUxKtClUThvAXVIQk2GO2KoZm
         i6rlEitC6IkiLv4bwWCBKuFIbECj31pSCKCIKDBmVs244PYRLlSQLNak4h6sGf3dmlIL
         tYq9DJ/NsHoBvxK+xJtlJvqmfn8YVQWucFV4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682029647; x=1684621647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o31TJ5tZoCsBlp2o0xbjnltm9BzQDN1XsD84HTTJdiE=;
        b=LOCTzkIueqS+HslvCoDCJJUjciL6XVi3IKZVLWRoM8XzQE2XpgOMqwmMbxTEZx9guI
         TKdC4jn+GMuQ0v1cPyPkuLyFb9bPS9fXwPmgiRwjDb4ifJCLCGshhFu12/wXU1gI0UAn
         yILxLaeEYBpwNZVx3HdS8FkOG1Zoho3uR7ApR9lLRXQkUKFMeq0nR7KP19waFMZ9T9pK
         al7CK8b/TLNsF6nJU1TdciqW7KwVhqFAc2E6fVQW2r6um4JoLtTQFeLut7cQo1+1rKuw
         c41ogXY9Tp0UP3iy013dzo4+ZZXym7d0X8tyPXP6qKOa8KFHW48e5Ex2sXafdxZ6ee22
         KILg==
X-Gm-Message-State: AAQBX9ded0iGiFWNMYQHluegWYZLTfaboPNisUlW67Ig+J8ARZgIdzLL
	ZDomx3/jC5qtGVhigJMQax0xBbfwbxvGi0QBd9uRGw==
X-Google-Smtp-Source: AKy350YYkQVXiZm4Mkscvi/IpAZSoW9J2dO7qAlgLrBroldm+jOlREbwvc6ZSCJEph/E0dWc6UQDvQ==
X-Received: by 2002:a17:906:300b:b0:951:756d:6542 with SMTP id 11-20020a170906300b00b00951756d6542mr412874ejz.32.1682029647312;
        Thu, 20 Apr 2023 15:27:27 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id bp23-20020a170907919700b0094f44bdf7acsm1242514ejb.57.2023.04.20.15.27.26
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 15:27:26 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-50506ac462bso1383687a12.3
        for <regressions@lists.linux.dev>; Thu, 20 Apr 2023 15:27:26 -0700 (PDT)
X-Received: by 2002:aa7:cb59:0:b0:504:aeb5:89c3 with SMTP id
 w25-20020aa7cb59000000b00504aeb589c3mr2953453edt.5.1682029645826; Thu, 20 Apr
 2023 15:27:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230413214118.153781-1-toke@toke.dk> <87zg72s1jz.fsf@toke.dk>
In-Reply-To: <87zg72s1jz.fsf@toke.dk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 20 Apr 2023 15:27:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=wis_qQy4oDNynNKi5b7Qhosmxtoj1jxo5wmB6SRUwQUBQ@mail.gmail.com>
Message-ID: <CAHk-=wis_qQy4oDNynNKi5b7Qhosmxtoj1jxo5wmB6SRUwQUBQ@mail.gmail.com>
Subject: Re: One-off regression fix for 6.3 [was: Re: [PATCH] wifi: ath9k:
 Don't mark channelmap stack variable read-only in ath9k_mci_update_wlan_channels()]
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	Colin Ian King <colin.i.king@gmail.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@kernel.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2023 at 2:09=E2=80=AFPM Toke H=C3=B8iland-J=C3=B8rgensen <t=
oke@toke.dk> wrote:
>
> So, with a bit of prodding from Thorsten, I'm writing this to ask you if
> you'd be willing to pull this patch directly from the mailing list as a
> one-off? It's a fairly small patch, and since it's a (partial) revert
> the risk of it being the cause of new regressions should be fairly
> small.

Sure. I'm always open to direct fixes when there is no controversy
about the fix. No problem. I still happily deal with individual
patches.

And yes, I do consider "regression in an earlier release" to be a
regression that needs fixing.

There's obviously a time limit: if that "regression in an earlier
release" was a year or more ago, and just took forever for people to
notice, and it had semantic changes that now mean that fixing the
regression could cause a _new_ regression, then that can cause me to
go "Oh, now the new semantics are what we have to live with".

But something like this, where the regression was in the previous
release and it's just a clear fix with no semantic subtlety, I
consider to be just a regular regression that should be expedited -
partly to make it into stable, and partly to avoid having to put the
fix into _another_ stable kernel..

             Linus
