Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446652222B6
	for <regressions@lists.linux.dev>; Sun, 14 Dec 2025 06:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765692433; cv=none; b=IVXp3ffIBgXPItykQwlR7uqmcDxP+Ax9YpGqrSKlPEDB3SV7maYYGPtECZJrq0I6K4ncWCVkhvWMfwTCKzyUEZ6y0qTqpdUD/o4qcew4NOKFnW9XOKdfMHCSpiAOORmKKRUrjaE4y+aVEN5xMmJtmTPk2ILYjk7L2fzC7NdALlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765692433; c=relaxed/simple;
	bh=r92Q2V8e+U0OW5eFV0h+0q8zFYT95BWs+m4he6KpbxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P/1Obs9StN5sDjZ6SKzgJj8BsDY4Xkc0X+RE3fK2WRSNp8KLfPKHnZsFktAuCXt4/b2EQ/p37BWKMUZ45AnzbY+uwaUOVaCW221ouHkct4J7lrVVJfYDCi8xHzHXfPSJ4wKBPoVH5hX5HggUPrM/BNmZvwfOfdaWRoBx3pM1O60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JR6is/6E; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JR6is/6E"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0abca9769so1246775ad.1
        for <regressions@lists.linux.dev>; Sat, 13 Dec 2025 22:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765692431; x=1766297231; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r92Q2V8e+U0OW5eFV0h+0q8zFYT95BWs+m4he6KpbxM=;
        b=JR6is/6EXmxKa4WMhhsku2ZqQ+PqxdUBSloTk3fXr3Mq6kNNoiQfQ+nzzhh4fFdGA0
         EEHG1sAtIww56x8Pj+VmZdZIxzD7j4zHHrYhPAHbXt/R5s5Ie0ST2g/1MPvv9Z6ZT3E1
         Q7wlWHGEVaTAM7/TSymTa10owjiFCs9ujbEQHwCtLswyebtvFobcZ2BSGpEAIp1I99dw
         qm82wBIH0m1wl/DpQHF/qHKf9niPrRF8KariE082BOkPWNA394BF1ofePLKPM+D1HBkJ
         fjGGZbnsCvwynbRSlQPWLn1zWmZiYUsLaSnvABNeKoBaApU6KvrtLyOznTANcqnfTUSj
         L3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765692431; x=1766297231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r92Q2V8e+U0OW5eFV0h+0q8zFYT95BWs+m4he6KpbxM=;
        b=wa3S6E2LFbF9WXNQ6DJZOoH9ekg/FarbsQlsugwLXyxsVIwXnsPhzpFi0INLanYjfA
         XBTGRhrS1cwNu/nycppw0XoyFoIRMKIMaQubI3yCE6maXTOF85N2qM3lURSY3CK9A2VL
         JewUgYfZUeNXWBNzskQXpmr07dpP2IcWzLkCy/i85FsaZJVc/2g7s5noBs2VIgbGo+lX
         HTT5BHwMxlgDR6y3yK3m1l9DHEdWs7cx+QMadmvOLLjKXgRp6L6d4a32ePiFDa7vxnxj
         kF2c1xBTQPLP63KfB7QefiQVGToa569dKK03jt0Fwj/yWUKFXvK8LGgGrRBJT7hv6dod
         +Mig==
X-Forwarded-Encrypted: i=1; AJvYcCVhWQcaDotlFLdMmZv1CeQDpjBf8vWeWcdTNRKO2NxOZYOLKwndSwfneo3cWVBLDh4DlN0aZt7Wck+iFg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwleYhlcFcRCUxczGrKqhjzwZlWYLJtga0I98GYXXn3fQerE8GO
	VWLhXMBp0q5twbF93+uNuTSt/2pdlFjHKvoobgVO7H5ZyVNlxk+Xu/8WST7qyDpAUC/gTChIZrx
	TEJpLNg+hKjj0mMGbORS/nCnQdLiJfYA=
X-Gm-Gg: AY/fxX4lLUjCKf2f8Yn4vp9UkcOP4fEtF36heOp36liN7MhqKWwGTwNXxLn8r07L/zI
	8qqCaj+YABVUJjXoQwgwLShY+nVuhD672jJEHgTe8/tzOsgNWFa1Y/AW+F6v65e0FtkEMaMBXZU
	THB4iXgQZL127rg9oo4p0PXer0MQMlIPVEBF/hrqURr22wbvnah3dWVf2L+QlGAnJ6r++W2wi7B
	/DSlcRACmlFczXuoo9xKUB3KcGHsfFw68Yxk1+A42bpePPR1J3P4sN4HbZMWtW95eG6be7jsOjy
	UGJCixNQfwc2jfDnkvXTtyN6lpU2GzC8/LeafUdtjxHbTHB7Oj40XhXnfeBSZf8BbgLLNNLQ3f6
	rxds7GHRA/AxdWIdTIBkpvyI=
X-Google-Smtp-Source: AGHT+IEjx4XmV7+QKdE4whfVgNEnoL/VMyWdZXt9WX2oOApywhA5AcUs+0KOuqeEhQKcom99245S1CriwR+pNcC4S4A=
X-Received: by 2002:a05:7300:2405:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2ac30185d3cmr2189860eec.3.1765692431485; Sat, 13 Dec 2025
 22:07:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1286af8e-f908-45db-af7c-d9c5d592abfd@gmail.com>
In-Reply-To: <1286af8e-f908-45db-af7c-d9c5d592abfd@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 14 Dec 2025 07:06:58 +0100
X-Gm-Features: AQt7F2qEeevNyJki3CDaXjdPegHadD6h80UJghjzYTaUz_sRuaFZb1Mi4GUBj6c
Message-ID: <CANiq72kYjNrvyjVs0FOFvrzUf7QYe8i+NpBS6bMEzX8uJbwB+w@mail.gmail.com>
Subject: Re: ARMv7 Linux + Rust doesn't boot when compiling with only LLVM=1
To: Rudraksha Gupta <guptarud@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Benno Lossin <lossin@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 14, 2025 at 12:54=E2=80=AFAM Rudraksha Gupta <guptarud@gmail.co=
m> wrote:
>
> - The kernel boots and outputs via UART when I build the kernel with the
> following:
>
> make LLVM=3D1 ARCH=3D"$arm" CC=3D"${CC:-gcc}"
>
> - The kernel doesn't boot and there is no output via UART when I build
> the kernel with the following:
>
> make LLVM=3D1 ARCH=3D"$arm"
>
> The only difference being: CC=3D"${CC:-gcc}". Is this expected?

It depends on what that resolves to, i.e. your environment etc., i.e.
that is resolved before Kbuild is called.

The normal way of calling would be the latter anyway -- with the
former you are setting a custom `CC` (either whatever you have there
or the `gcc` default). By default, `LLVM=3D1` means `CC=3Dclang`.

So it could be that you are using a completely different compiler
(even Clang vs. GCC, or different versions, and so on). Hard to say.
And depending on that, you may end up with a very different kernel
image. Even substantial Kconfig options may get changed etc.

I would suggest comparing the kernel configuration of those two ways
(attaching them here could also be nice to see what compilers you are
using and so on).

Cc'ing Kbuild too so that they are in the loop.

I hope that helps.

Cheers,
Miguel
