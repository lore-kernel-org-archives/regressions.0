Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE1033D2
	for <regressions@lists.linux.dev>; Tue, 12 Sep 2023 19:09:48 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2bcb54226e7so1924551fa.1
        for <regressions@lists.linux.dev>; Tue, 12 Sep 2023 12:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694545786; x=1695150586; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2QKmtHWodHEWcW+VP4XGZgYZ6yzX48HwXCnApPwIfs=;
        b=XVfmhABZpNxdYwjgEaXlPoIIU5Gi/6+BNSKA+tMzgr0PeFqxW8WXXiV9lXLa3Tlfkl
         A7oI5gJ8S6ohAVEyGEPn7vM1OovKf0e0pTy/jVuhxV3yhrmo+DEw//kWoXvqXsyhZ2f+
         twdKe3SeZph93nQ0BenDaBnsn6SUDWbhAqKusX6DTxYHfir8q2yKjA9xJCet1kScP5bk
         R2s2LR7F3vFkGq/Euf4IV5B8CSynSkYI87BRnIaqCkhGqUQnhqjIsRrIAcHZ+FanBoav
         IAVU8K9E1HLKfN7nSNasj8ui4nYPs9+177MxAOzIGw3ATKZFbFIvyP6p+IAplYBNy+Mm
         ZwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694545786; x=1695150586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2QKmtHWodHEWcW+VP4XGZgYZ6yzX48HwXCnApPwIfs=;
        b=RZjShcZjNio0pws4U7WeUkC3YywAez0z7eq9RLRa7FdtGA+MMsfloSkqZ3D3nPw9we
         VhGXdCyHx4Dw22+sx+kGWaaoD6L5KXRF//vB+XIG5EeSzO113/bgxtWEmiVrJeGxUWhS
         0qirrh08c4ocsPezGkpPz4Po/DY+DTtD+AyazKao2BivY76r5P1kJ0oxfGokmVTvKvik
         fXcwjZN3SUGodordoAv3XXcoj7KD70xVfr0SwGulJG/2mvuJsaRDFUxziOpDuT6INeY3
         DKexFndpZwUVin3N4ukL1CxfEw2ED3xdzoq9nkuQfjEoVNc6TfKXuoD+tqA2U735R5fc
         Ty1A==
X-Gm-Message-State: AOJu0YxTayHxaOmCS7+oneMUSEGXvTlfgryPJvNKA0trUfP1UQpiKj+u
	aCYTkUXkFNHh4C2cUs2pQfcCW7C0cVKej+cVQ3y8ZHS7
X-Google-Smtp-Source: AGHT+IEOIrNMeNQxPXExf3y0619mpuQ7YipVHakWGYM49/XckJiyVbA5KsHtuC0A5TCAtMojnvXN2l2a7UWmHU64ZNQ=
X-Received: by 2002:a2e:aa22:0:b0:2bc:d993:5a58 with SMTP id
 bf34-20020a2eaa22000000b002bcd9935a58mr1317419ljb.17.1694545785763; Tue, 12
 Sep 2023 12:09:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230829205936.766544-1-luiz.dentz@gmail.com> <169343402479.21564.11565149320234658166.git-patchwork-notify@kernel.org>
 <de698d06-9784-43ed-9437-61d6edf9672b@leemhuis.info>
In-Reply-To: <de698d06-9784-43ed-9437-61d6edf9672b@leemhuis.info>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 12 Sep 2023 12:09:33 -0700
Message-ID: <CABBYNZK2PPkLra8Au-fdN2nG2YLkfFRmPtEPQL0suLzBv=HHcA@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_sync: Fix handling of HCI_QUIRK_STRICT_DUPLICATE_FILTER
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: patchwork-bot+bluetooth@kernel.org, linux-bluetooth@vger.kernel.org, 
	netdev <netdev@vger.kernel.org>, Stefan Agner <stefan@agner.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 11, 2023 at 6:40=E2=80=AFAM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 31.08.23 00:20, patchwork-bot+bluetooth@kernel.org wrote:
> >
> > This patch was applied to bluetooth/bluetooth-next.git (master)
> > by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:
> >
> > On Tue, 29 Aug 2023 13:59:36 -0700 you wrote:
> >> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> >>
> >> When HCI_QUIRK_STRICT_DUPLICATE_FILTER is set LE scanning requires
> >> periodic restarts of the scanning procedure as the controller would
> >> consider device previously found as duplicated despite of RSSI changes=
,
> >> but in order to set the scan timeout properly set le_scan_restart need=
s
> >> to be synchronous so it shall not use hci_cmd_sync_queue which defers
> >> the command processing to cmd_sync_work.
> >>
> >> [...]
> >
> > Here is the summary with links:
> >   - Bluetooth: hci_sync: Fix handling of HCI_QUIRK_STRICT_DUPLICATE_FIL=
TER
> >     https://git.kernel.org/bluetooth/bluetooth-next/c/52bf4fd43f75
>
> That is (maybe among others?) a fix for a regression from 6.1, so why
> was this merged into a "for-next" branch instead of a branch that
> targets the current cycle?

We were late for including it to 6.5, that said the regression was
introduced in 6.4, but I could probably have it marked for stable just
to make sure it would get backported to affected versions.

> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
> [1] see
> https://lore.kernel.org/linux-bluetooth/b0b672069ee6a9e43fed1a07406c6dd3@=
agner.ch/



--=20
Luiz Augusto von Dentz
