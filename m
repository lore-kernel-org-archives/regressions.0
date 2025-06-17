Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370942C08B5
	for <regressions@lists.linux.dev>; Tue, 17 Jun 2025 09:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750153737; cv=none; b=kuIxSifI4vlm+DZW4ylpZYssU/dQlmgdu0Zt2a2x7jykDWiqsvBM+0gjvNtnpDmFxfUi2CKg5H+9GWx5v4OVOeNMDe7cm7dsKjoGweRhfDdliXBvxbEiae8zuHZuOtc0gII5dTRx5aDCAJ7i7CzbX+6rBCV12QYiX5mj9kI0WCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750153737; c=relaxed/simple;
	bh=yU8B2S0rvUJRYS4eDEpg/4azZ5qYIqxzpKab9dnBZz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ff6F3S89dDKPbLAS4zwCneN6Exf+RJTWYKUCTOZUWUJWHl5+jbqZSbes6zO1gNaivRI7bgPH16PBQIu5rUk0on2nekORkyIYTk3uUguewzJogjaoKv1NcvPp0neOW2Nic2nkhGnalId+Ke6nTJelDwSGHm96RlLcWtgQii5/qq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HboJ9PAC; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HboJ9PAC"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-87f2170921dso835330241.0
        for <regressions@lists.linux.dev>; Tue, 17 Jun 2025 02:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750153734; x=1750758534; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJabXLtW1m0bIrhc/aru55FQgKQQl5SUoAdpl7Ryqe0=;
        b=HboJ9PAC0LcpA3IqXFI8kPjVXB463fE/WgCn6xOjqjMtrxDDB8bJfWDwmwPr3wa4K/
         9kTSZFNpgWLdvK0jJrKguqhcD7sgZ9ckKRpwP+kWqnxY2g+EwUXQvZ/0pF4WWaAYBzRD
         JM4syc2UzVYYT4OYlnyEABo1lCWiA/J+ADd4OOyIg5nepYjc6soNWJywrRXu7iBuKrxh
         VeuaAlBQCVuD2hfmvSk37VbGZpWPAJBddxcUTeZkUk3XOigNwycC8Q8dfZGjVEuiVNUx
         G8ajuPTdzKzydFtCm021bD1GUX0zlQOhmuUPlxwW22JRLuXfARJ1tBCWhvFF+otnLESo
         FZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153734; x=1750758534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJabXLtW1m0bIrhc/aru55FQgKQQl5SUoAdpl7Ryqe0=;
        b=bAq8Dp4BslbgMqVi5jvozwwJk2Bu+pf4DZofIS+b8mwIyojp52o4QqYR26jhaa5dNe
         dI2yxmQCMCs3M2cvCVgrU0Gd1+WH7JluaUEYL6lr8BZsqg+wwzxP5A6J3Wh+MCFL9v+G
         j69Hink0nO+Yeuvig6MaJOeQij7VaQsSP+8RTAPvg7kudCN1XBWlwl7eknhHEkRWEALb
         0nVys5SQLKMHkLthVD4JnaYOC5QlS2GpEAPrTGTamhDISp8+eiCVOlDTWYAbmJ6J+oVn
         sByPfnWW+ORxQxlUhObN1Wz9iwVStk40DeD9NQZvAnbjBTVMP7IqdAwwGc/FuAGHjOA7
         KVLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR6DQ9L3p8itCnWdcvjlfGi0ewQpjNmrZYZIVsSHlo/ruws0EpjdEJVkPDcBImzGwdzduULnqQNyR4Cg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJnoOvWn9stSRcHZqSplkOXmbKqGIu6RFqSEBZWBL4yEJWMQWx
	Lgn2ef/AwrKcgua+42uKLAVSCSpTA30cl0IOaR6yv1DuO3MGB/oFx7eg5tqX2oUq1nH09CR2IbT
	UeBKvQWuST8+m1oKa50HjSNkTr8JsidimPd56J52P0Q==
X-Gm-Gg: ASbGncszmY0VViYk1GuTczHlI6EjMnkKw9h8i6Tx/D7teJbKB0ySk44SorjE1IQzA2k
	HJ1eNAVQhpm4LhtAL9mCIsO/6MmIwk/d8Egs2hu+7Vqeg3BYHKwJFByaKTreZyemWF0nc6NrWsI
	brGmhSP+NbADP1P5MC13wyugXnVgCcBAXB5FZnubBOuwBbW1FZ9240JuxyTDeutjhnZkovlJFM8
	UODpTold1y/1oM=
X-Google-Smtp-Source: AGHT+IFqlwLfs3w5t0Kke4vusAJ0LDpMDoRdBhRndcFHTCxIPX6kVlBZ7kOElI3G6E8LB5BuhyWmQMy9mQlLjgSj4NQ=
X-Received: by 2002:a05:6102:4b88:b0:4e7:db33:5725 with SMTP id
 ada2fe7eead31-4e7f632331bmr9323586137.3.1750153734104; Tue, 17 Jun 2025
 02:48:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYssELHcYKwgGNBMLrfeKZa9swGdLrH7gxqzd4P0kaOiZg@mail.gmail.com>
 <7c101fe5-7c73-4916-a832-d656511eeab8@heusel.eu> <ec18001d-7123-4d13-aea7-a28594cd137b@redhat.com>
In-Reply-To: <ec18001d-7123-4d13-aea7-a28594cd137b@redhat.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 17 Jun 2025 15:18:42 +0530
X-Gm-Features: AX0GCFuBeLu3_hPbiCBoM4g8VWlAFlv6r7WSlxB2DJ9al6JMin7gQdwU7P-bZ5E
Message-ID: <CA+G9fYvoYSpyxpBAcAje6X7707+y9cc84mUrWMvdLtZc3Np1eQ@mail.gmail.com>
Subject: Re: clang: selftests/mm gup_longterm error while loading shared
 libraries liburing.so.2 cannot open shared object file No such file or directory
To: David Hildenbrand <david@redhat.com>
Cc: Christian Heusel <christian@heusel.eu>, clang-built-linux <llvm@lists.linux.dev>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Vlastimil Babka <vbabka@suse.cz>, Shuah Khan <shuah@kernel.org>, 
	Zi Yan <ziy@nvidia.com>, lorenzo.stoakes@oracle.com, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, jackmanb@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Jun 2025 at 01:58, David Hildenbrand <david@redhat.com> wrote:
>
> On 16.06.25 21:14, Christian Heusel wrote:
> > On 25/06/16 11:02PM, Naresh Kamboju wrote:
> >> The following test regressions noticed while running selftests/mm gup_=
longterm
> >> test cases on Dragonboard-845c, Dragonboard-410c, rock-pi-4, qemu-arm6=
4 and
> >> qemu-x86_64 this build have required selftest/mm/configs included and =
toolchain
> >> is clang nightly.
> >>
> >> Regressions found on Dragonboard-845c, Dragonboard-410c, rock-pi-4,
> >> qemu-arm64 and qemu-x86_64
> >>    -  selftests mm gup_longterm fails
> >>
> >> Regression Analysis:
> >>   - New regression? Yes
> >>   - Reproducibility? Yes
> >>
> >> Test regression: selftests mm gup_longterm error while loading shared
> >> libraries liburing.so.2 cannot open shared object file No such file or
> >> directory
>  >> Test regression: selftests mm cow error while loading shared
> libraries>> liburing.so.2 cannot open shared object file No such file or
> directory
> >
> > These do not really look like kernel regressions, rather like a bug in
> > the userspace testing tool =F0=9F=A4=94 Could it be that the tests were=
 not
> > rebuilt for the new liburing or that the dependency is not installed in
> > the test environment?
>
> It looks like the tests were build with liburing around, and then ran
> without liburing around.
>
> Note that the file for example has:
>
> #ifdef LOCAL_CONFIG_HAVE_LIBURING
> #include <liburing.h>
> #endif /* LOCAL_CONFIG_HAVE_LIBURING */
>
> You should be running into similar issues with cow.c, which uses the
> exact same approach for detecting+linking liburing.
>
> So seems like something is off in your testing environment?

The kselftest built with cross toolchain((gcc-13 and clang) vs (arm64 / x86=
_64))
and tar / zipped and exported to NFS and mounted by DUT the
device under test by using overlayfs.

The tar / zipped file has all installed binaries and script files to run te=
sts.

However, The missing debian package onto the userspace has been installed
 + liburing-dev today. This will fix the reported problem.

- Naresh

>
> --
> Cheers,
>
> David / dhildenb
>
