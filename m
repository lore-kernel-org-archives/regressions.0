Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2CA79F6
	for <regressions@lists.linux.dev>; Sat, 13 May 2023 19:53:10 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-199ba5154b3so666566fac.1
        for <regressions@lists.linux.dev>; Sat, 13 May 2023 12:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684007589; x=1686599589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKnUGuMyQddL8Uvsex1Z0TjgGFq0tLnmJqvcma+3L5k=;
        b=HbCngJG4uTOze1qPsdYCZbxWziGcPon0eIHT9dn1jiZW9KyEHitJhdfDVv4cBMyZo3
         9oab0ViVhQy8qojtbWL2jp5718+c22qXvSUr7mdgD3ym0VRp3iwklZQDWtX0hQxYfFVh
         aOdaskmHKknzy433KAJwh6vXJKW6yHsPSkgMl4xj+5fQkw1ANq33/A4Og66QeKOyCqCt
         jdeDHYMIdVYcRyeMhZHDge66puDZbZ8A21wNPWTqF3e2RPKwz+pOCjVx9R46mQwdnqxz
         sVWXNZ1cq2L2hZu8pULvV+PWiyNty9BAEtmBMWzMpwmOdlZfx9W0/2MbEzv6I1Mus/nT
         1IrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684007589; x=1686599589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EKnUGuMyQddL8Uvsex1Z0TjgGFq0tLnmJqvcma+3L5k=;
        b=TNZ3tDFmL0RGJPDBnlPq1OaPO7arI3GFJ1C4vEGmy/dC1eBLSgb9+OYEm6W72cg7mu
         lmEXSJ2IVOrMwnV5UW0DnjqhW0AQCf1bd3O6UU+q6xoNcR2ke3g6E4NtZ5k9tf2N+c4o
         3dLVeYf7uHW1SyZUDAkIfF/nfoIAkNKO6xh6dYCBJE2qPk8m9lhD3OWutF5p/RvfF+s3
         BenPpdCJUZv9qB4Oax/rZ4YE44P7BYKK7htSBahce/aT+qStc+pZwK+SY9v5GiYePEwN
         Gfbfd8GNN+3eFDZr7eZPEy5ltjcBe08nbI05h1LQeAJt+STsN0U40lrQIxMZzpUWJerV
         G9jA==
X-Gm-Message-State: AC+VfDx1wYiXw3/9S5P8WY3xfRPNXydaJ7vNxltsvM+dgjgUin5Yfkb8
	4vHGROWabneJTTFNai/Q/8W8T6k2bPEL4W+kkdqR/KgZuN6svg==
X-Google-Smtp-Source: ACHHUZ4+9ESMyjKgM1moUKdJXq8n11MQ+BwtANHeBZ62+Ic4FnhLljw4ilR0v04fepPxlhQ3q2S+C+VJ7ZWQWHwC9r8=
X-Received: by 2002:a05:6870:738d:b0:187:f238:3db with SMTP id
 z13-20020a056870738d00b00187f23803dbmr15431411oam.19.1684007589147; Sat, 13
 May 2023 12:53:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <bug-217440-225600@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217440-225600@https.bugzilla.kernel.org/>
From: "Joseph C. Sible" <josephcsible@gmail.com>
Date: Sat, 13 May 2023 15:52:53 -0400
Message-ID: <CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
Subject: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000 on
 warm boot
To: regressions@lists.linux.dev
Cc: kailang@realtek.com, perex@perex.cz, tiwai@suse.com, 
	alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Forwarding my regression bug report submission per the instructions in
"Reporting regressions".

#regzbot introduced: 5aec989130
https://bugzilla.kernel.org/show_bug.cgi?id=3D217440

Regards,

Joseph C. Sible


---------- Forwarded message ---------
From: <bugzilla-daemon@kernel.org>
Date: Sat, May 13, 2023 at 3:46=E2=80=AFPM
Subject: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
on warm boot
To: <josephcsible@gmail.com>


https://bugzilla.kernel.org/show_bug.cgi?id=3D217440

            Bug ID: 217440
           Summary: ALC236 audio disappears from HP 15z-fc000 on warm boot
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.3.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Sound(ALSA)
          Assignee: perex@perex.cz
          Reporter: josephcsible@gmail.com
        Regression: Yes
           Bisected 5aec98913095ed3b4424ed6c5fdeb6964e9734da
         commit-id:

On an HP 15z-fc000 laptop that uses Realtek ALC236 for sound, once the syst=
em
is warm booted ("reboot" from within Linux), sound stops working completely=
 and
the device doesn't even show up anymore. Once this happens, the only way to=
 get
it to come back is to cold boot ("poweroff" from within Linux, wait for it =
to
turn completely off, and turn it back on with the physical power button). I=
n
particular, once you boot from a "bad" kernel, no number of warm boots with
"good" kernels will ever bring sound back.

I bisected this to commit 5aec989, which first appeared in 5.15-rc6. In
addition, I confirmed by doing a custom build of 6.3.2 with reverts of both
f30741c (just to avoid a conflict) and 5aec989, which works correctly for m=
e.

--
You may reply to this email to add a comment.

You are receiving this mail because:
You reported the bug.
