Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D1D10780
	for <regressions@lists.linux.dev>; Tue, 21 Mar 2023 21:27:01 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-544b959a971so269773717b3.3
        for <regressions@lists.linux.dev>; Tue, 21 Mar 2023 14:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112; t=1679434020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quiegcQSCiXRFTXNojeIfrcsBYh/Ff/DgGvH4TpI6jo=;
        b=Lj676nPtWBnUX3fqsr1xp/SnihGpFQ8+V4hkPfV1/gUS5f72bJ9jQuYU0h5Ta5l2ZW
         5cUi/Anrkrp1js8pDJ84/rHnFPBaPWIBtxvtHsjcZT+5qFKPj1ilyvQ1YJS7nm2Px2fW
         FCycjzYeiQHBbSWGyr2Ih3l2MbjPG5Fn7QG6XuJwgX6nn2/2MwDFa45VOJyJBpxR4oPr
         2sBcQ7xtZjWNeXA98mFCdrEEBUN0QuRpAqxVkNeUeybT85/bxBIaBcEL6vGJG9fIE8e6
         8NsE3sCrT2hiaczGqOYp6Ty8bUx6CjYVQidQQHJPTpxL9RmtfsMnP0eXTRRj3CNwW4lm
         8PEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679434020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quiegcQSCiXRFTXNojeIfrcsBYh/Ff/DgGvH4TpI6jo=;
        b=MVff0fcEjfTR0drni3jVBSuTf3I2h/JhA0bSMCxmec33yAhBETZyvahsjbAtp3wRq3
         kXfIkTml/zdLiEAAAMPHb4x8h4Rn8u2BXkHfE1o4gZpDWtQY0ucPRoer5v+JmRfZSVWb
         +SEb2P8xRhX/HcKglUyD+gdOPjM3WIhkrioOzYmcUK+s40WiL0lzixDjQgXUNGzDZyBy
         TF1RLbRvfRXet/RW2fuNL1kbcBPSb2KsRUvJLv9d1mao6DTqbTpZIH+Vx3Cf/9v6b60B
         dplUM1rcJGHln/E0lTTm70MsMnvkjRr680dsa/Hya1obwMbWTXEJOMIEHnL7I9f1kE7z
         M6lg==
X-Gm-Message-State: AAQBX9c91vqqXZLmgFgmJokzHoDeX++4LpFq2BMYAM2xp9W7AZSJDFKd
	0HCnyN/6YbN3WhGK193QMpA2859avuzwRTRUHP2v0g==
X-Google-Smtp-Source: AKy350ZobmZAx6jRdIic7N58KhFORCo1uOULJ1qMAuCQGaQFmluAMfxfKUlCer3QUP0c+0OPQHkXhKzy/zcVqyKl110=
X-Received: by 2002:a81:ac20:0:b0:52e:ac97:115f with SMTP id
 k32-20020a81ac20000000b0052eac97115fmr16105ywh.5.1679434020436; Tue, 21 Mar
 2023 14:27:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHmG9huwQcQXvy3HS0OP9bKFxwUa3aQj9MXZCr74emn0U+efqQ@mail.gmail.com>
In-Reply-To: <CAHmG9huwQcQXvy3HS0OP9bKFxwUa3aQj9MXZCr74emn0U+efqQ@mail.gmail.com>
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 21 Mar 2023 17:26:49 -0400
Message-ID: <CAEzrpqeOAiYCeHCuU2O8Hg5=xMwW_Suw1sXZtQ=f0f0WWHe9aw@mail.gmail.com>
Subject: Re: [6.2 regression][bisected]discard storm on idle since
 v6.1-rc8-59-g63a7cb130718 discard=async
To: Christopher Price <pricechrispy@gmail.com>
Cc: slyich@gmail.com, anand.jain@oracle.com, boris@bur.io, clm@fb.com, 
	dsterba@suse.com, linux-btrfs@vger.kernel.org, regressions@leemhuis.info, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2023 at 6:41=E2=80=AFPM Christopher Price
<pricechrispy@gmail.com> wrote:
>
> I can also confirm the issue occurred on and after kernel 6.2, and
> confirm the workaround setting btrfs discard iops_limit works for my
> device:
>
> 08:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd
> NVMe SSD Controller PM9A1/PM9A3/9
> 80PRO
>
> I had to use ~6000 for my device, instead of 1000.
> I'm currently on kernel 6.2.1.
>
> I am also interested to know what if this is expected.

We got the defaults based on our testing with our workloads inside of
FB.  Clearly this isn't representative of a normal desktop usage, but
we've also got a lot of workloads so figured if it made the whole
fleet happy it would probably be fine everywhere.

That being said this is tunable for a reason, your workload seems to
generate a lot of free'd extents and discards.  We can probably mess
with the async stuff to maybe pause discarding if there's no other
activity happening on the device at the moment, but tuning it to let
more discards through at a time is also completely valid.  Thanks,

Josef
