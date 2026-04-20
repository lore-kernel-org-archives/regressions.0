Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6327C15746F
	for <regressions@lists.linux.dev>; Mon, 20 Apr 2026 06:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776666676; cv=pass; b=eSRQc2xtFd1ABvA7DmWmLmKO4pcW84xYXgnMbSMsOSHg5I4dQOkYijhhrwOE7MYl/8ajcI//xC0K7kRfE53TI8XSPU5YekXRDHAIA/kzW/w3xy0JldcPRa43xaiWgOkE4HrA2ZUEtKzxIfxDcBrVzTvCt1y7l1dgPsvVm39fpR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776666676; c=relaxed/simple;
	bh=oWdHSX0eVcAgY4PHQuy8lYwoogzXG2T9LHnjRsCPmEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P6C7v55b1jJ1AivScak1Ue+AX8ENxuQwn3/lqKM9upvPtefL5tPRLIrRzF5t+K19JUjABkLk99cMow0wIC255UPdNLninHOckGAjaNf/DLEUvenOMtwFWTbDairly9IWNn6oqDed4/2AV6G/Tbuj/gOrjh2RCS876Uuyzu8kwrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bhdj7/YQ; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bhdj7/YQ"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-50e61648f10so225931cf.1
        for <regressions@lists.linux.dev>; Sun, 19 Apr 2026 23:31:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776666674; cv=none;
        d=google.com; s=arc-20240605;
        b=hpOnH/tOB7AJpERy2nWfx1I7hpOyWzPPTOn//DG7djofmnj1Im94XobFaghPENXJp0
         o/z1PkpP8RXtru08TxbEJbuFUxmDlXjFF58Zy8XAKf7wGExRDj8LojSwALAAU2WZRyvt
         H6w9VDYJpzTV0UR+2+40EmJWKKMdA19V+eOMA/qgG7ifX7HoPpwUN+R2uH7Cn+zzIokc
         6saltZDsBcW6thCrdUnOlrhbYnSs47883sjGLnsBUnqWCyPg6vk1614apOKgmZkBHWWZ
         yPh+6/uUKZqop22MmoAUYh0VN9xn7VdNKZlm48Stn9KPfbOHiRgozxjcj7ApeZAlhtPX
         Q6pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oWdHSX0eVcAgY4PHQuy8lYwoogzXG2T9LHnjRsCPmEQ=;
        fh=yX8wTMEe25cxjPIJ8GUyb9CscwGtNse1gHs8vf0HSCw=;
        b=WE+EYrM4EK2UcvAT+ulXTCrf4xFuzz4dzuaCxDNv/v9zHAUdEa73mHW6632yDOlXO1
         Jmfy7uRBf+i6WlrwHCvFq1B/Lfbk1w9S7btMoKhMjuIWGRXnNO42cyTQ4h0rcui9Fg5g
         gju8sNdmPjWKfpKLah9R/w5547GE55MEMqyi1nlpwHKQ+y4qdYOO0ZnP59gZfDU/QP20
         baCC6kL/Pfg5PoqzUWCDPNmwymvbB/KBzmimt6q8XymifoYB7WcBvyvmNul0n92Z6vfc
         XHaV4dVV17NYJAfnStTImFB0zWm57ZooGzn8sTiB4RFebbeNNT296kI5jPkRMG6ybTpp
         E5gA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776666674; x=1777271474; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWdHSX0eVcAgY4PHQuy8lYwoogzXG2T9LHnjRsCPmEQ=;
        b=Bhdj7/YQ88Otz1ZIzEkrxizDIYoPcRH/pX5UShnGyLlOVURSbghb/8GbGF/1fNznus
         1jobqWM74mASob6PTY/OtjfQSiz1QxcWVlcplhG/HRlS+MgJY3agPBCGH/LH0Er4GDX0
         UlQCAeG4Q620WBSIhE5sZUurSf6C+y7+cNz5WDpcGf16aDna01WsVBNqmuMPuzy75Xhe
         gfF0wXAkFBDIJfkd+y12qlPdJH/JAR3JsGe3i4PeDKiglI1k9SEG7+hIkWG0HJalDACV
         4KWJfolTHLJoLvnIEVD87FoQpZkveGw8XUhLkvN+N7X1sb7nPJAfJvqxPhGl+u3nwBrT
         mVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776666674; x=1777271474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oWdHSX0eVcAgY4PHQuy8lYwoogzXG2T9LHnjRsCPmEQ=;
        b=E0fwnl7bdqgFQFiFDdtaRfSUAhE+3WckHktFh9b/8l1+8CqrP0plsYqrMwvTSy7QXT
         LZyXR+yGw9MajlFnjwCL6N+D5lNsVQOrEhaw2CalapoqctnvFPOlwgBCa1UprdN8uPLS
         rgQ4Nd2BuQQ3JM5ywUtNbrUGLzbUBUxRlabryOwFEOfHF7mgRHBZKvLi+yJNMH0xOO4r
         n6VjQmAf01/KnW6y6VSz+rrhNceizDgkCOEno7Sd9pr68JLBdrcHlasMoZWMtz1eWcO3
         zzU28zZn4ta+acSuDY8+RKY8irjuPdx9RtPx1+IVpSBmrJLKmtCFRijtP5P6EPsLx9p+
         5ccQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gtf9Q2vjY0dZgfoT4p1R0+8hwd74dFRiERoHljpD8ZVmKdv9ZkL37l5KegdLlAfD214tD9VvKYWQ5kA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzpUNZl7BL2d4wNZjkpeFt8qAFOisdpETfNuGxkhsvYdarQk+44
	P3V+NVLinKdoWI/5RuHEsKlvhCc+IITl50kRLGx5cIHIfYBP8dYa9KfUHJnAYm0UCLkDv3KmUBX
	TK0oSfpTPXtfmq5be5W9q9OD0Lrjc4aDMQp/WGh8h
X-Gm-Gg: AeBDietLC+ezzdcFOVlMLUWeLGQyXcSgQAWKkxdvetoj/v+eD39p1Rhznt7DOq4ERvC
	y3iqvVw+YGDrivefwI+aak7GkjzznLlkpiwwKyLWpDjBWybKfmu7qHI/nwEFZ94I/81WC6oOTPy
	kNvApzPAVGz0Xc3D9tFxBDLCJ4cjOWkrMK4d0FsiHwcIJs6nCtAI0DWWJRbl6ays1FVTFsSw1+b
	qRD+1XQkN5OQXVBDKDVRGyI2MoanWIHFOVflDypa7+0NoeEOzk7I6AO0Hw57d1aOz0vXK10ju7P
	FbPan5Mtu5Cd5Im2Cwz+pbZdpjjq
X-Received: by 2002:a05:622a:4a0b:b0:50e:38f0:ccb2 with SMTP id
 d75a77b69052e-50e441d1391mr22856791cf.15.1776666673848; Sun, 19 Apr 2026
 23:31:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHWLEDHfXZScF5jNDzgOxGXf-MBDcVNtqW0DbNz8Ra8rtcuL+w@mail.gmail.com>
 <CAOdxtTbwipkyAfDakLAB6aVp6YkPWtKpDdVDUTz88WDB-18HXQ@mail.gmail.com> <CAOQ4uxhUn6oCBuVJqZu+FcMx8XeAQHZbXFAGon4Xeg2SPLJW_A@mail.gmail.com>
In-Reply-To: <CAOQ4uxhUn6oCBuVJqZu+FcMx8XeAQHZbXFAGon4Xeg2SPLJW_A@mail.gmail.com>
From: Chenglong Tang <chenglongtang@google.com>
Date: Sun, 19 Apr 2026 23:31:02 -0700
X-Gm-Features: AQROBzDX4AAYXOOslqCZs98JMxceUov0-GNl39rBWIuX_y_Te2pwHmhQJ7fdw3g
Message-ID: <CAOdxtTaWWu_7eJWu68zf28zHQP3Y--vXTfbGFsceO47BpN3qxA@mail.gmail.com>
Subject: Re: [REGRESSION] Return change in 6.12.80+ with volatile mounting
To: Amir Goldstein <amir73il@gmail.com>
Cc: Derek Taylor <ddtaylor@google.com>, stable@vger.kernel.org, 
	regressions@lists.linux.dev, Kevin Berry <kpberry@google.com>, 
	overlayfs <linux-unionfs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Amir,

Thanks for looking into this! To answer your questions:

1. Production vs. Test Suite Impact

The immediate failure we encountered is in containerd's integration
test suite (TestImageVolumeCheckVolatileOption). The test explicitly
reads /proc/mounts and expects the exact string "volatile".

In default production, containerd passes the legacy "volatile" string
to the mount syscall, which your patch correctly handles under the
hood. So the standard "happy path" is not broken in production.

2. The purpose of WithTempMount() / RemoveVolatileOption

Containerd regularly makes temporary overlay mounts (e.g., for
unpacking layers). Because overlayfs rejects reusing upper/work dirs
from a volatile mount, containerd uses RemoveVolatileOption to strip
the volatile flag before these temporary mounts.

Currently, containerd's RemoveVolatileOption does an exact string
match for "volatile". While it works for the default path, there is a
production edge case: if a user explicitly configures their container
runtime to use the new "fsync=3Dvolatile" option, older containerd
binaries will fail to strip it, and the temporary mounts will be
rejected by the kernel.

Conclusion

While containerd could theoretically patch their code to accept
strings.Contains() or fsync=3Dvolatile going forward, there are many
existing containerd binaries in the wild. Given that this patch breaks
containerd's CI tests and introduces an edge case for
RemoveVolatileOption, it might be safest to fix ovl_show_options in
the kernel to continue outputting the legacy "volatile" string to
strictly guarantee backwards compatibility with userspace.

Thanks,
Chenglong

On Sat, Apr 18, 2026 at 8:40=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Sat, Apr 18, 2026 at 1:33=E2=80=AFAM Chenglong Tang <chenglongtang@goo=
gle.com> wrote:
> >
> > CC Amir,
> >
> > For example, containerd 2.2.0 uses `volatile` instead of `fsync=3Dvolat=
ile`:
> > https://github.com/containerd/containerd/blob/main/core/mount/temp.go#L=
91C1-L92C1
> >
> > On Fri, Apr 17, 2026 at 3:41=E2=80=AFPM Derek Taylor <ddtaylor@google.c=
om> wrote:
> > >
> > > This change seems to have so far affected at least containerd in an
> > > issue reported here
> > > https://github.com/containerd/containerd/issues/13250.
> > >
> > > In stable versions 6.12.80+, commit
> > > 6c0cfbe020c0fcd2a544fcd2931fbc366ee3cd12 with the specific change
> > > being:
> > > [*] The mount option "volatile" is an alias to "fsync=3Dvolatile".
> > > In this scenario, code relying on checking "volatile" will now fail
> > > due to the return being "fsync=3Dvolatile".
> > >
> > > #regzbot introduced:v6.12.80
>
> Hi Chenglong,
>
> Thanks for the report.
>
> Is this problem in production containerd or in a test suite?
> I did not understand the purpose of WithTempMount().
>
> Is it possible to fix this function to use string.Contains() instead of
> exact match to the "volatile" mount option?
>
> If needed I can fix the kernel to show the legacy "volatile" option,
> but I would like to first understand how bad the impact of this regressio=
n
> is on real production workloads.
>
> Thanks,
> Amir.
