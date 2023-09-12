Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544C71640D
	for <regressions@lists.linux.dev>; Tue, 12 Sep 2023 07:08:48 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6befdb1f545so4014374a34.3
        for <regressions@lists.linux.dev>; Tue, 12 Sep 2023 00:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694502527; x=1695107327; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hv2L+KIK91RPAfSw2HE5xZRSf6YXmZwJ93Tmif92bV4=;
        b=tco6k+Ws+0tShUxw7iqcCdGc/zC/9aczd6zC7DHwvCMsNjRNI67uYyp3BdyWc4yiwT
         otbfU7Be6/pfHjywh3ZEZ0sJoTYD7FB6LU0Psb+STYFphzc/zmAFj46xCM4RVmla1XcG
         vvNwoj7w5IfGPlqcdIsW/mFDW8zgRQK7b7VzXf875l0UwcBoBOGJzu+ntOkPW/zFPB6u
         KEx4SCQYlgtV+wPvsYflE8AhFAOHNsTUkSC2TUeoBLfGEzD9ziqJILEVTltgroJsT71y
         XPvGSkdowy93Ywzq2b7OrjPkIl2CuvZ7JcK9MM7iNBk4S4mtIpQqq2xP91PJ1nu2cPNQ
         Cvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694502527; x=1695107327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hv2L+KIK91RPAfSw2HE5xZRSf6YXmZwJ93Tmif92bV4=;
        b=qUXxg5YPdj2PfC3gMHU0vdNFeBc0mn4GUnBgAH+/tcs27VuAtWTPhQ07Rc+vb59oCX
         M10CkCcdKqyUXqQ/8vwMUfQMxQxSzPk9texrfgP96GONxobbb+ZO+msR/+WSUzAgjLE5
         NnMlfq4QL3+p6PdemcvtVudyZpwEQuDSXDup0oFsxlcRVvllLWsgC1mw5EU91DTN+beK
         Ixvt8C5L8Qvlo6kT0MqMz/n80ira+1aGZDaYfTAJVqxvRPsg9OXkhNJP0GDVMPJagALX
         ACIvazsj74ehW9fVVni12NCFyad8S6OSMsdtYPzxyPT8c79iU4lvOkyPV94HxhrpJexJ
         qnSQ==
X-Gm-Message-State: AOJu0Yw9j/82XaLg3Ofuwi9SA0/MwS8V7AoC5VVHyMo6105y2mvfH7q4
	cLGh9BO7D7clL4w1OpHwVNF2SLHxJItd/7ciSgQqVw==
X-Google-Smtp-Source: AGHT+IHBe3WqmlJ9znIl9UDkcdScIM2fyekx+hlEsGTzORc2dGYHkEZ989cOo3htoGUENtuvxLjItVsneETXU9qweME=
X-Received: by 2002:a9d:6e83:0:b0:6bf:1fed:95ce with SMTP id
 a3-20020a9d6e83000000b006bf1fed95cemr11702047otr.22.1694502527347; Tue, 12
 Sep 2023 00:08:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230829165627.156542-1-mario.limonciello@amd.com>
 <20230829165627.156542-4-mario.limonciello@amd.com> <1d891d34-053a-368d-cf47-bcaf35284c79@redhat.com>
 <07353676-bad0-44f8-a15a-4877f1898b6b@amd.com> <811225f8-c505-7344-ac18-882472ee0348@redhat.com>
 <d232c11d-901f-4ebc-b408-bed042ed8da9@amd.com> <6734c409-89f1-89a1-3096-4054be29faf1@redhat.com>
 <f0ceff1c-ba5f-4c6b-ac0e-c4195f477500@amd.com>
In-Reply-To: <f0ceff1c-ba5f-4c6b-ac0e-c4195f477500@amd.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Sep 2023 09:08:36 +0200
Message-ID: <CACRpkdYGxreyD8NVuKs2G44htR8EixdvGr3+ma=HrxHUP3NDQg@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: amd: Add a quirk for Lenovo Ideapad 5
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Shyam-sundar.S-k@amd.com, 
	Basavaraj.Natikar@amd.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	lucapgl2001@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 7:53=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:

> Linus - please disregard version 1.

OK!

> I provided Luca a new series that implements this approach that Hans and
> I discussed and they confirmed it works.
>
> I have some minor modifications to it to narrow where it's applied so we
> don't have needless notifications and will send it for review after the
> new modifications are tested as well.

OK standing by, I'll wait for Hans' ACK and then merge it for fixes.

Yours,
Linus Walleij
