Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6908115AF7
	for <regressions@lists.linux.dev>; Fri, 12 Jan 2024 19:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9U4BIcZ"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dbf2740355fso2616979276.0
        for <regressions@lists.linux.dev>; Fri, 12 Jan 2024 11:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705087944; x=1705692744; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWZyqbuCyes2XUzEpE38w3XGfwfjhbR2pOBjXgvzPqs=;
        b=d9U4BIcZmNkbYF/9GPOiQXfwhvMYBoR336nJPzrZWHVEUGq6Dqz4kEC51B6LGVOldK
         7O+p1iKSI4ctFcOStVs4gX8APjxxaiSOfALJZkO4y9dMk/jvuPhg6OLc3d50dCzdoX0l
         1OcnEv0+0y9358usNFBxtJYR0D2X/fDY+cANWatSO6yZ5lvNnrvOxkLUKBVpzkqU2rLk
         GhHTS+FbVpv880gYv9zwHYwF9xIUfs6FeXnWQ1pAFek4hGwGP8/n663LiZ2U5qf92vcS
         xSqPLPf9EnAJJTxm/WwuluchUMjUW+OW6fbt/fQK0XoZhubaa/XjCCQCgEKyU21F+4AX
         8ikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705087944; x=1705692744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWZyqbuCyes2XUzEpE38w3XGfwfjhbR2pOBjXgvzPqs=;
        b=MGMBbTnHyHfXOtHR7B0I4RyzrKBll/NzJOMaOF+nyHrpzqoMnVRsUCioUmrIIS4PNY
         mKU8r4omhGt1t0g2/IjN36a3m1coi1Zy1TwtFxDnraU3ct7zy8Am14sEHw6qUzQ2kqcB
         8NZQG9IYXKKp/wLER2vG7VB1XgnztMbSxLyfvXDj5nyajyzBUK+XxK325EeaDasRIbfw
         XankLM9ZVhQP/uNVeZs77AiH+g6EHNS5JtIKKwClMbZe+EeNO3IuUiO8BQRO9YnbMEsf
         CvefJg7mveuCuBBmWvnWJet5x467kViaMyBJKPqSkYo8LgGPV2Zucbv4WL6s5HPRoube
         l0eg==
X-Gm-Message-State: AOJu0Yxv+wDULcfXHeio6MJwd1XkX2cYHGeNAiqD4ELEvewbRa5w4yaI
	GINeviFG81vgZRVKiUxSvZu+TRjc3JQcT+CKViY=
X-Google-Smtp-Source: AGHT+IF5AHQNoTYNYqzXKMf7ayCFabGY/obwfiSYlO9P1bpccUjMLtdMli8LJ/dDqN+pbUy7lEEK02KROV3a91Rj6p0=
X-Received: by 2002:a25:b91:0:b0:dbe:3074:c6f4 with SMTP id
 139-20020a250b91000000b00dbe3074c6f4mr799841ybl.30.1705087944330; Fri, 12 Jan
 2024 11:32:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAAzPG9MU2PfTk2Yn+spJqH6mLVsG1p6L6vhJ4LFG+aiojnN6HQ@mail.gmail.com>
In-Reply-To: <CAAzPG9MU2PfTk2Yn+spJqH6mLVsG1p6L6vhJ4LFG+aiojnN6HQ@mail.gmail.com>
From: Justin Chen <justinpopo6@gmail.com>
Date: Fri, 12 Jan 2024 11:32:13 -0800
Message-ID: <CAJx26kVJ=TxxejKACMJOoiEZfwpFJ9A3SGncBtd8QyWM5+ew0w@mail.gmail.com>
Subject: Re: [REGRESSION] In v5.15.146 an ax88179_178a USB ethernet adapter
 causes crashes
To: Jeffery Miller <jefferymiller@google.com>
Cc: stable@vger.kernel.org, 
	Linux kernel regressions list <regressions@lists.linux.dev>, kuba@kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 10:01=E2=80=AFAM Jeffery Miller
<jefferymiller@google.com> wrote:
>
> For 5.15 attempting to use an ax88179_178a adapter "0b95:1790 ASIX
> Electronics Corp. AX88179 Gigabit Ethernet"
> started causing crashes.
> This did not reproduce in the 6.6 kernel.
>
Looks like my patch set was not fully backported. The patchset didn't
have a "Fixes" tag, so it looks it was partially pulled for
d63fafd6cc28 ("net: usb: ax88179_178a: avoid failed operations when
device is disconnected") which does have a fixes tag. Just looks like
a bad backport here. Apologies, I should have caught it when I saw the
stable email, I didn't realize it was only for part of the changeset.

Thanks,
Justin

> The crashes were narrowed down to the following two commits brought
> into v5.15.146:
>
> commit d63fafd6cc28 ("net: usb: ax88179_178a: avoid failed operations
> when device is disconnected")
> commit f860413aa00c ("net: usb: ax88179_178a: wol optimizations")
>
> Those two use an uninitialized pointer `dev->driver_priv`.
>
> In later kernels this pointer is initialized in commit 2bcbd3d8a7b4
> ("net: usb: ax88179_178a: move priv to driver_priv").
>
> Picking in the two following commits fixed the issue for me on 5.15:
> commit 9718f9ce5b86 ("net: usb: ax88179_178a: remove redundant init code"=
)
> commit 2bcbd3d8a7b4 ("net: usb: ax88179_178a: move priv to driver_priv")
>
> The commit 9718f9ce5b86 ("net: usb: ax88179_178a: remove redundant
> init code") was required for
> the fix to apply cleanly.
