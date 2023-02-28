Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51343363
	for <regressions@lists.linux.dev>; Tue, 28 Feb 2023 00:13:19 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id s26so32928349edw.11
        for <regressions@lists.linux.dev>; Mon, 27 Feb 2023 16:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6auFiAxxwFQX0LU6IDVQBC5x+vKf3oYBXM0DErxZxvI=;
        b=WyRCq92RDe+UQsw+OulHf91BjcSh0ZNcWIbjV9bQZb41Z5ufwDP0Oxl6fp/ndxnXK3
         cHegcYVt5f5F/axkxTafznwrGmwop0xP/cRiStZBrVWwF1KXAhgXbcmSlyLnKNvE4HVD
         CQ+szfvnAjeZKLQSztoCSWslwKGDwJAgTNWRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6auFiAxxwFQX0LU6IDVQBC5x+vKf3oYBXM0DErxZxvI=;
        b=wzunP8+M5xih2Y/+6edRxT88SopAOX1AYKOG/Wl84TkU9FEHe/q1wk4OM7hYBiaAVy
         XtCddBY06owAr+tjvUf5lOIFsiuKnZ5g0UzU9saRvCRmx/4oZagAeH/cZmEHzUP2ZA2y
         7LzbIWOKy8mzwvUZYIE9CfgmcpAhXTV6zThVFiQIu92pyJWevCVYYW2P8adfA+jcJZOj
         QPPH6A64/+7PrEnsjK7N1JfML/SaEdp1oQ8e2V/PJPqor+QuXSFug3TLg/ZMZkSUJg2I
         3rGIa+l7EPx4THwR1EPWgncSdAEJtpWOWjWoKZte0BSyXtnMt1uo63kRSkCZMHKHu1W1
         tpcA==
X-Gm-Message-State: AO0yUKV80E7ndGPM2rKpMfVEoCAPr5lOJTLAM3O6IG/qX/Fj4+/n3pHf
	iLXZxooe0vtcsEUq5onZkRJXkoP/OhpuVW75Irw=
X-Google-Smtp-Source: AK7set95owSu09q7GDBJCPIptThV8BLSf/5kHwGer9SstlrpFkm1L/LlwTtvdPhHLKHPQGl4Of+Oyw==
X-Received: by 2002:a17:907:72cb:b0:8ed:5a7e:5e44 with SMTP id du11-20020a17090772cb00b008ed5a7e5e44mr1205779ejc.34.1677543197258;
        Mon, 27 Feb 2023 16:13:17 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id bq7-20020a170906d0c700b008c5075f5331sm3795650ejb.165.2023.02.27.16.13.16
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 16:13:16 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id ec43so33019694edb.8
        for <regressions@lists.linux.dev>; Mon, 27 Feb 2023 16:13:16 -0800 (PST)
X-Received: by 2002:a17:906:d9ca:b0:8f1:4c6a:e72 with SMTP id
 qk10-20020a170906d9ca00b008f14c6a0e72mr277841ejb.0.1677543196114; Mon, 27 Feb
 2023 16:13:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1677529301-19530-1-git-send-email-george.kennedy@oracle.com>
In-Reply-To: <1677529301-19530-1-git-send-email-george.kennedy@oracle.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Feb 2023 16:12:59 -0800
X-Gmail-Original-Message-ID: <CAHk-=wggVYzViaq47Ms7Aw54UaB4fr9FiiKcr3zCqAkMePcXuw@mail.gmail.com>
Message-ID: <CAHk-=wggVYzViaq47Ms7Aw54UaB4fr9FiiKcr3zCqAkMePcXuw@mail.gmail.com>
Subject: Re: [PATCH v2] vc_screen: modify vcs_size() handling in vcs_read()
To: George Kennedy <george.kennedy@oracle.com>
Cc: jirislaby@kernel.org, gregkh@linuxfoundation.org, sfr@canb.auug.org.au, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux@weissschuh.net, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 12:22=E2=80=AFPM George Kennedy
<george.kennedy@oracle.com> wrote:
>
> Restore the vcs_size() handling in vcs_read() to what
> it had been in previous version.

I took this one directly since I'd been involved in the discussion the
whole time, so we can just close this issue.

           Linus
