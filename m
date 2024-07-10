Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4498198A30
	for <regressions@lists.linux.dev>; Wed, 10 Jul 2024 16:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720629422; cv=none; b=nNdMBfySt6HWmMqIFRzKAPp2S2SFjFuGqNQbTLctz4czWpZsIBYALAL7MWP1IVuTwLj7L+/d6QPFsMQ9f9EzdhlE9QfTy0n34Dt8yB+BiNd4HtDl4RClOYFa6TS+EaoKcsGvcg2nYtlDn79za93+6L4OTi3MmhtsOpoL9GgaqtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720629422; c=relaxed/simple;
	bh=+9WXWxoYOKWamD+vE5uwNUduTJzyXrMb8PWgNp0n1rI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=banJNbojIotz+iHi2lm90wvhB1FORA22Ahzml0VFb8AEsgUbO0EXjpp6slnjlDDdiZu9NQo7TyH0l5XGD7E65qbJHbpxWwn/xqU95lZ7Nj27jLhWxBZyBjCBPaSYOV81Q1i5MgdVAvwERh1OJDnly+GachxwhQODIhGPx7JfFBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pwR2j1BQ; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pwR2j1BQ"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e03a9f7c6a6so7053100276.3
        for <regressions@lists.linux.dev>; Wed, 10 Jul 2024 09:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720629420; x=1721234220; darn=lists.linux.dev;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JdEk/xS42cer+nsNbr3GxVg6aR55CredoMdTWrvWjPQ=;
        b=pwR2j1BQUDhetrRNZbIQ7J5pKyPAF9cjQ7OZL95L5dXv90rw8KMchr8PdnM9GRRm96
         fxTOjgEnhyUu3LnG++9Gp+nHXMc0n8QcXzLe4lLW1m1l8PF1fuKF7++PqHjDvabUpQGA
         5IPMy4+jdT50trIhoCIxYQ9Gr+YyeHylqEuOflf7EnH6Aj8uAfb10V3WQHmoNeNDX0n+
         AFpm3z2JiHFbq77Y73idTzmP+BE5jzsMtDyBl+FNbotXUj/s++YSkYBw+300feHX06rt
         VulJ+iJ2oPKgTn1QboSF1EdXrXl5zwPT27MZtZvzOdvtP3F3yzC8nGGKJ5uFnNqrrc7t
         unFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720629420; x=1721234220;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JdEk/xS42cer+nsNbr3GxVg6aR55CredoMdTWrvWjPQ=;
        b=ny+7GsX72FTsAqCclO/yrp4eWCqi97uatvHTaxYDvpiYH7xWgqKk1va/e0lb3M1nXv
         GaPKC+bKG/UmX61wbKireXxK8M7B2mtKbAHivKLJLaxxeex3WqVAvHu+UzABpChDCwau
         MyIVXML+UXuHYUSsPywUCU1nTRfB+XmV920HBLWHUCB9ekaRUxQEk7tcDk/DTcKt8Z0B
         gEVgioRhG7bPSBa13ege/qAW16sGatggrDklkAJtvRK2XFfqWoekTCEi2p77Zz8hTNe/
         4M42qilZsTv7HKZt/1kT6Jfl6BE+mmhO669vJDFPQkivfJbQ8JqEW9I4xIw4qwFTWUcY
         CPyA==
X-Forwarded-Encrypted: i=1; AJvYcCVe9fCGjCIvSlFK8il7nX4+KKxYIDF9JvdbFnLxX5KodzJ3CPVcggkl2STAou0UKm4yrPjp5IVi3TLznJc1WVPZdMo4iSHWs1aEy50=
X-Gm-Message-State: AOJu0Yws2dakWkXdyiglmU7LO7jLJb5doKEeMXWb1QFEN7OlDZhPvsDR
	4xG/YZGawK1DkUsLxrupOa4lbFbV5vhmD4ztI6m/F5ewiUuxncLpwWZ6OUXhOg==
X-Google-Smtp-Source: AGHT+IHmlzxMBt1I02mYgCVVFfyZwoIJo3cnM1aEwxkR/fsMcy2EzuwB+V0Pzq8JtvZgB7eiWJDgSg==
X-Received: by 2002:a25:6808:0:b0:df7:8dca:1ef2 with SMTP id 3f1490d57ef6-e041b0788b3mr7334664276.34.1720629419734;
        Wed, 10 Jul 2024 09:36:59 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e041a99e948sm655418276.63.2024.07.10.09.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 09:36:59 -0700 (PDT)
Date: Wed, 10 Jul 2024 09:36:48 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Paolo Abeni <pabeni@redhat.com>
cc: Hugh Dickins <hughd@google.com>, Sagi Grimberg <sagi@grimberg.me>, 
    Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, 
    Thorsten Leemhuis <regressions@leemhuis.info>, regressions@lists.linux.dev, 
    netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v3] net: fix rc7's __skb_datagram_iter()
In-Reply-To: <934ac0b8491ec56dd35b9f0ab7422daa1926c4df.camel@redhat.com>
Message-ID: <1c72ac52-9830-c2f9-5a14-d1487da8fabf@google.com>
References: <58ad4867-6178-54bd-7e49-e35875d012f9@google.com> <ae4e55df-6fe6-4cab-ac44-3ed10a63bfbe@grimberg.me> <fef352e8-b89a-da51-f8ce-04bc39ee6481@google.com> <51b9cb9c-cf7d-47b3-ab08-c9efbdb1b883@grimberg.me> <66e53f14-bfca-6b1a-d9db-9b1c0786d07a@google.com>
 <934ac0b8491ec56dd35b9f0ab7422daa1926c4df.camel@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Jul 2024, Paolo Abeni wrote:
> On Wed, 2024-07-10 at 08:36 -0700, Hugh Dickins wrote:
> > X would not start in my old 32-bit partition (and the "n"-handling looks
> > just as wrong on 64-bit, but for whatever reason did not show up there):
> > "n" must be accumulated over all pages before it's added to "offset" and
> > compared with "copy", immediately after the skb_frag_foreach_page() loop.
> > 
> > Fixes: d2d30a376d9c ("net: allow skb_datagram_iter to be called from any context")
> > Signed-off-by: Hugh Dickins <hughd@google.com>
> > Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
> > ---
> > v3: added reviewed-by Sagi, try sending direct to Linus
> 
> V2 is already applied to the 'net' tree and will be included in our
> next 'net' PR, coming tomorrow.
> 
> It looks like the netdev bot decided it needed an holiday (or was
> fooled by the threaded submission for v2), so no notification landed on
> the ML.
> 
> @Hugh: next time please check the current tree status or patchwork
> before submitting a new revision. And please avoid submitting the new
> version in reply to a previous one, it makes things difficult for our
> CI.

Ah, great, thanks. Yes, I'd heard only silence (and was worried because,
although I only saw the effect of this on 32-bit, suspect it could cause
lots of obscure trouble more generally).

Hugh
