Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199E33E5EF8
	for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 12:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892824; cv=none; b=unrWyyAX9/GOGIjRIENuIn5uftyjn/tnKlU9W4b28RQjuY3gqhVDw70qeVXJ+PTqi/2bLc53wy6hqIrJ/yrN1I1eXCGEYLsPmGsbrOAqq3aZFI+B/Wh9HtJ+jy0i3m6FzNy9mYkXGLp7LhhqOajj3I7Gngx+mFZfBJwvIraL80U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892824; c=relaxed/simple;
	bh=lsBHDyCfIWhi3VwWkUb2uLpFXgL/GQX1v3gq+h23/wI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qCidzUd2/N2E4d7QZGKmgfCCKOSPGFUIgUOAmJL9NvVwwSV5yMJw27THnK3APnweFXYmhes1NJ3ydYSBpmDLNNMasL6KANHuLeekuTbBc7OeTpKQ1cHg18o37rohVAgv4RCcWNhB8HjsnbT6EXq8xm7S5fFXZ1zAuaBXpg5ET8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h07ONTAb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h07ONTAb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E51031F00893
	for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 12:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791892822;
	bh=mwF5fDDf9ldJfUewdzwZbaLTxq4SylhnnpsHOc72+Xg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=h07ONTAbis93nHQE0OHW+8rq3uinSlCqhuhLrxOuNxjQaSrlTaScf1izzuIvZmUI+
	 MzkgTecQQqSqjOSHvV96qdfx/C8YBIzkImoMlVy3lbRUHzBZQIbhJFWqPPwrnyuK9e
	 XHMRxvpdGS3fqf4HTFhhTyd4XDHnB67AwT0diqjqsdjpMensjV8AaxB0C2wvj0Y97p
	 wUqb2UydADI3ahnvyUtV9L4S6TN+Q67JqUoV0XIQQU4LgwKMgcukCPhR06xXpwZOyP
	 JWQJhbz+o+Vtm4lkcStUj0iiwTUvaY2JV8fMpBUcC/xTEIKF7MuNS001Ih/qBjyYHr
	 c20rtNBgSA3oA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bce4e278baso2942324e87.0
        for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 05:00:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzk20rU15idBmz37TNxV/tP7gJiVseoklCggePQYexZtywNFiBLuikheqTkPF7GS7FKJxPbPgcBqYOgHA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ2cdvPr4j0MWDC2PCIGkEeDLPe4Bcg1qVGloX1C2ZG3NL+gpwh
	yzp6corEvosGHaEK1umVCzwuWgJv/aFsSeddeW5vlcEPew4fJSczkpyMho1bicBfKaTClzgPJbo
	S9IBMiGdriol9H+uv0jBYSvNnbCuCZGE=
X-Received: by 2002:a05:6512:304b:b0:5bc:b4e5:37f2 with SMTP id
 2adb3069b0e04-5bcdd501368mr3713074e87.18.1791892820950; Tue, 13 Oct 2026
 05:00:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <37N_jFulf7n-Z55NfKfE71C_wVPxYvZ0xD_iRUg2fXu7TypDiF5PStQ6siSfVBih6fThg5WoPes8U5ZQpfVm_teMFcUGXFxz2DdMbfSWuws=@proton.me>
 <20261012225141.13683-1-aliamemis@disroot.org> <fb993dd3-ee56-4e3d-aa16-573f011518f1@oss.qualcomm.com>
In-Reply-To: <fb993dd3-ee56-4e3d-aa16-573f011518f1@oss.qualcomm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 13 Oct 2026 13:58:15 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gS4agVUkCO6M=VW4Wi2y1-s+k23bpzmX9aAZ0Rsv4z9Q@mail.gmail.com>
X-Gm-Features: AclHuK_C_dbr3KeIp2vqfLebsjNfIQiI7_fB5E-myb508s6cuKhwC9dTzsMdEoA
Message-ID: <CAJZ5v0gS4agVUkCO6M=VW4Wi2y1-s+k23bpzmX9aAZ0Rsv4z9Q@mail.gmail.com>
Subject: Re: [PATCH] ACPI: battery: Re-read battery information in the
 complete callback
To: johannes.goede@oss.qualcomm.com
Cc: =?UTF-8?Q?Ali_Ahmet_Memi=C5=9F?= <aliamemis@disroot.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Armin Wolf <W_Armin@gmx.de>, 
	Charis Stratakis <c.stratakis@proton.me>, linux-acpi@vger.kernel.org, 
	linux-pm@vger.kernel.org, regressions@lists.linux.dev, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 11:33=E2=80=AFAM <johannes.goede@oss.qualcomm.com> =
wrote:
>
> Hi,
>
> On 13-Oct-26 00:46, Ali Ahmet Memi=C5=9F wrote:
> > Since commit d33e89d12295 ("thermal: core: Suspend thermal zones later
> > and resume them earlier"), thermal zones are resumed from dpm_complete(=
),
> > before the PM_POST_SUSPEND notifier that re-reads _BIX and _BST. On
> > ThinkPad P1 Gen2 and P53, INT3403 _TMP calls \GTST which switches the E=
C
> > page selector (HIID) without taking the BATM mutex used by the battery
> > methods. ACPICA releases the interpreter lock around EC accesses
>
> I'm wondering if this "ACPICA releases the interpreter lock around EC
> accesses" is not the real problem here.

Yes, it most likely is.

What actually happens is that ACPICA drops the interpreter lock and
the namespace lock in several cases listed in the
acpi_ex_exit_interpreter() documentation comment, the majority of
which involve having to wait.

The bottom line though is that the interpreter and namespace locks
cannot be expected to be held throughout AML evaluation because it is
not known in advance if any of the cases in question will appear.

> Recently I've learned / heard
> from a trusted source that Windows ACPI subsystem is very much single
> threaded. So it is nice that ACPI has these mutexes and other stuff
> to support multi-threading but as long as Windows ACPI interpreter is
> not multi-threaded I think we may need to consider to copy Windows
> behavior.

This is also my conclusion, at least to some extent.

The problem with it though is that in some cases parallel evaluation
of AML is actually useful.  For example, say two PCI devices are
powered up at the same time and AML waits for each of them.  The async
suspend/resume aligns those waits to take place simultaneously instead
of serializing them which allows some time to be saved.

> So maybe the EC accesses should keep the interpreter lock locked during
> EC accesses.

The problem here is that it is hard to say in advance whether or not
_BIX or _BST will access the EC and whether or not that will clash
with _TMP evaluation for a seemingly unrelated thermal zone.

> And even go further and maybe we need to introduce a big-acpi-lock,
> which I guess the interpreter lock more or less is? And just serialize
> all ACPI accesses since most ACPI tables clearly do not handle
> multi-threaded access to ACPI methods well ?

I would be inclined to do so except for device power management
methods, that is _ON, _OFF, and _PSx, that are not the problematic
ones, at least as far as I know.

> Another example of multi-threaded ACPI calls causing problems is:
>
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

Right.

So I guess the idea would be to add locking to acpi_evaluate_object()?

An alternative might be to introduce an "exclusive" variant of
acpi_evaluate_object() with built-in locking and use it in the cases
that are known-problematic.
