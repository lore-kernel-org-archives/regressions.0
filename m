Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255001D1731
	for <regressions@lists.linux.dev>; Wed,  2 Oct 2024 20:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727901936; cv=none; b=rhduLyg6yXrUR1baagzG5rTn+ik6RLrUG0xHyj/jCVcL06tBJQzosa1e/Xvs9/Lot2RIfahY/felwJD4csBAfysIHh0Zw5bVdiTz6PTKwL13uS6vBgodU9R7Ik1LuUxVZkw6SxQL5PL4b8i5dlyCoLtQb/oL2RDayeZRfiB62Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727901936; c=relaxed/simple;
	bh=r5ua7STwZTPVMtH1PGVZOozH3aM5m0l2oOhzZM++RYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b6o89orol2iZirz2JJCuJs1AtDUzz2SPCVuQN/ILr2/NkEDoFRvkMO44H6/ZGImeDqnOPtPK4AP6nks4HWkdOpJQgMg8C2vnpG5L6IFWWQHNnx66stX/Iq7oXVhRDbFtW5ppaJXrPWPiqPhKmjc81NBAFm7xVM3ge7mCxMr5oSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkysyeIZ; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkysyeIZ"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6cb2aaf4a73so1939756d6.2
        for <regressions@lists.linux.dev>; Wed, 02 Oct 2024 13:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727901934; x=1728506734; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5ua7STwZTPVMtH1PGVZOozH3aM5m0l2oOhzZM++RYA=;
        b=dkysyeIZBhbCarkSM9vkKM2lNZ6kIaeP8j7K4tRbYhS2NX3E7ZKSsoQhOkjPR1qHVr
         Hdk4QVGv/UiHFHKFb3T8uZRUk3teHYfFiZ9eo9OCMoP2zCb97CwUqOheFyDYX7xmNx/x
         cEF66GmWQjiTjebs+wFiPlz23iOUxTgLScQOpH+dOi5ZtVklGeuH2YxkLewwJvxS3HAB
         3QurdbuXlddH6nRyeNVvb2BbrLRkwiivvp4OZiHfvQOoFeN/ZqgwpM6HHmH22/z890UT
         6EXtC/GuFklZj9EJC3qkQMZFf1i7B/jEfq44xYlEuoJp8YkheZgEE1lf0GGJDjLdoWUU
         zSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727901934; x=1728506734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r5ua7STwZTPVMtH1PGVZOozH3aM5m0l2oOhzZM++RYA=;
        b=vQNj25xPVnPK4N8L7LVY1j5v9Nv4NlNa2Nq2CwNL5fyDERmu4AnRjPJDSPk9Fm4ki7
         4X9KBms+yuTfByc75GFEkkmdbwMrTq3n5EtraeEsUuhwZqq0OufCRF0qWQwd3wA/cRVq
         GvzGxeWrWxp8WaLJ/g1JDsWiu1sulviuy9JhY7AnQk6wSvWKtOrhyZt/9YluzxxnlGy3
         Hs3u4/2IVE2Agkr0WJNGMTQjHuaQH+xcPNOzrMLOvcP4ow2XEd3CC1/nCr2bXXWgB25z
         EPsHc4zX83FfmrpddKeUFcB5OvM0Pkfhk916vh0zpEFarOxVdyZZNljpHI4dJTzKkg36
         IfeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFpqXJ6dNvIhmWT3BhFsE/eyggdcGxBkOMAuU3/5py/YI1X+EyREgsFpTLZ3CZOGpw2SC4hg7po/PUYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5ZWU01O+JayyI6voGQGlP2jaLhs0Byh6/MuEcZv2SEP5u0MCA
	3/nkIL2oBCYH/by1XqxHavqbpDvAFPUFiSZE5GJmkW0wUg406V63qBH/xNpVxVxK7lkBE3GX/Qh
	vJNHGjmq00EzIjyIbl6fqUghD+Rs=
X-Google-Smtp-Source: AGHT+IFvRf0Pxcb3wJuPeJTsK8vYkAQv91LEsZobHX9BvFAeqsRLRIv43cHdKoLCTjXDYXArXPEueCLHvEMn7+L8RS8=
X-Received: by 2002:a05:6214:53c9:b0:6c5:5384:96b3 with SMTP id
 6a1803df08f44-6cb81cc379fmr56780016d6.52.1727901933943; Wed, 02 Oct 2024
 13:45:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsOPwuoNOqSMmAvWO2Fz4TEmPnjFj-b7iF+XFRu1h7-+Dg@mail.gmail.com>
 <CABXGCsOw5_9o1rCweNd6i+P_R3TqaJbMLqEXqRO1NfZAVGyqOg@mail.gmail.com>
 <f6bd472e-43d9-4f66-8fc2-805905b1a8d9@lucifer.local> <302fd5b8-e4a4-4748-9a91-413575a54a9a@lucifer.local>
In-Reply-To: <302fd5b8-e4a4-4748-9a91-413575a54a9a@lucifer.local>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Thu, 3 Oct 2024 01:45:23 +0500
Message-ID: <CABXGCsOsZ5TyEjSWTk6e=FU30a27N4J0gqNCat65gweyKPtZ_A@mail.gmail.com>
Subject: Re: 6.12/BUG: KASAN: slab-use-after-free in m_next at fs/proc/task_mmu.c:187
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, linux-fsdevel@vger.kernel.org, 
	Liam.Howlett@oracle.com, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 10:56=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> We can reliably repro it with CONFIG_DEBUG_VM_MAPLE_TREE, CONFIG_DEBUG_VM=
, and
> CONFIG_DEBUG_MAPLE_TREE set, if you set these you should see a report mor=
e
> quickly (let us know if you do).

mikhail@primary-ws ~/dmesg> cat .config | grep 'CONFIG_DEBUG_VM_MAPLE_TREE'
# CONFIG_DEBUG_VM_MAPLE_TREE is not set
mikhail@primary-ws ~/dmesg> cat .config | grep 'CONFIG_DEBUG_VM'
CONFIG_DEBUG_VM_IRQSOFF=3Dy
CONFIG_DEBUG_VM=3Dy
# CONFIG_DEBUG_VM_MAPLE_TREE is not set
# CONFIG_DEBUG_VM_RB is not set
CONFIG_DEBUG_VM_PGFLAGS=3Dy
CONFIG_DEBUG_VM_PGTABLE=3Dy
mikhail@primary-ws ~/dmesg> cat .config | grep 'CONFIG_DEBUG_MAPLE_TREE'
# CONFIG_DEBUG_MAPLE_TREE is not set

Fedora's kernel build uses only CONFIG_DEBUG_VM and it's enough for
reproducing this issue.
Anyway I enabled all three options. I'll try to live for a day without
steam launching. In a day I'll write whether it is reproducing without
steam or not.

On Thu, Oct 3, 2024 at 1:32=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> Out of curiosity, what GPU are you using? :)

The issue reproduces on all my machines.
One has an AMD Radeon 6900 XT and a second AMD Radeon 7900 XTX.

--=20
Best Regards,
Mike Gavrilov.
