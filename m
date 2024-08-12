Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487374D8D1
	for <regressions@lists.linux.dev>; Mon, 12 Aug 2024 13:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723467617; cv=none; b=nmt0MPwP2ivCZ22pg8FT61WkVQKVJK/gJAkwO5RhaJMHnOvujfaAEqHszDJdb6xszEbJsEwZKY5y+Xord6LZ+5cyehnL+4AjU/zK6D9E7nBZLFvCiFqnp6akjTg9Bx70idlkCdnvI95pvCGfLNcSoD1ie7FE6LS1tDZn9N4es48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723467617; c=relaxed/simple;
	bh=ycS5uwrP16faVcsS5Vbtkq6epmL5YNX+zKVqt1TI6sg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=PcqlDh34jHoS9UIZ2hpEyqwJOJiqMZwVUmZtLHvp2+0CCIbDegLes/nO7jRWj/zNYrCAxVnRfutGInT4XJwQP+0ElFAPDD1eKusrAuTru5I7JNY9leVADLjRKvzYhBM2PKG7Yni8pzUSPaj7nu1lx9h9+dM5FwGiaELtHuvfpeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fEKw5MUs; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fEKw5MUs"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e0e6cbec8caso4076049276.1
        for <regressions@lists.linux.dev>; Mon, 12 Aug 2024 06:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723467615; x=1724072415; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vp7K0cujp+P1oC+ZhXjPYO1Siuq9eUS6nF9jvB4g4+k=;
        b=fEKw5MUs7nWhl9CsWpcXE9tbqa15onOnyTuSt4M1Y2GNoU+wLs0M4sowPtMki1UVFL
         xuWTYBTAsioP0sXyXhOiWLCQILCrtzIjHOQkgG10AsZ9nTWpgr8qoIHIXSa6QXGaeULf
         1xGFJQBLGxJQf/THLtS3Z5sYmjladqlK09ORNCd5sQC82NrLFqXzu6fj6Fa764dBgXEl
         B9gHe0SL7N0kmu1kR6UJX0OV0nSbESgZPwEn1rhg2+yxC7i3r9rwtEuLY44a7v6Qkjxi
         5g5ytgT2Ebe/SB9Vsszj6tEzUU4jfoGhEUfsMQ5tQyG5Y9Cg5KefCaLGiEQhchHPA7K6
         dMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723467615; x=1724072415;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vp7K0cujp+P1oC+ZhXjPYO1Siuq9eUS6nF9jvB4g4+k=;
        b=tPCj3FKyjmc96feVCEaSRiePdBvppyMXeMiYhDxiLoFjYfFcyyjSZW4vclSnFkP6Ol
         oa/GTaW/hh7OqSNIX9z3jEPounUyh5i3lcVrdLotjK1FCZmxZsEb4fYjAC+oD6Tn+QKL
         B2852FWxRaO8BQWgGaFAX0SSqY9UyhjwWFUveLT+7kY+Na2PLlU88IjF7Kr7zMZt8/H7
         VxEa12JNCmJBkY/JL602QBJliYcqQ9P5z1tcuhPD59wwShpm4wiAdlnTIoepU5/Ni4E0
         Rwhkyxz0Kq2U7tJVAWUt07RJwN42QyqkvznDTtC8A1v+M8AxkvpzE3U/5fJo9VAJQ3MR
         YEUg==
X-Gm-Message-State: AOJu0YxhVpR2HqFmEpjIWncY5aeVOuF1JXJKvo5i3sCSPS2qMgKrEXdA
	sITm+tqHE5BnC3+kP5njHoFMm9/uSwzo4mJd2Zed8J6+tlYSoX5367XqX7ZfaRaOzEEkuXUCDuB
	+jJm6SG7IhjXjV1cMLYfaz9kR4Oq5DL3p
X-Google-Smtp-Source: AGHT+IErv0cMUwsGArue7vMUu5IUNFwHOfLmeIK0X0vr/whSOae886MUs0XFc0JjzLjgeJoJgXqDeLvLWBT2VTS5bmM=
X-Received: by 2002:a05:6902:1ac4:b0:de5:5693:4e96 with SMTP id
 3f1490d57ef6-e113ced5f0fmr231116276.27.1723467614697; Mon, 12 Aug 2024
 06:00:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Chris Bainbridge <chris.bainbridge@gmail.com>
Date: Mon, 12 Aug 2024 14:00:03 +0100
Message-ID: <CAP-bSRbDhtwKPj=Jb_TSyvGQXnK4vxeyiPWYbOwRmrWf7_JOVQ@mail.gmail.com>
Subject: [REGRESSION] bisected: nouveau: possible circular locking dependency detected
To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

#regzbot introduced: 551620f2a3816397266dfd812cd8b3be89f14be4
#regzbot monitor: https://gitlab.freedesktop.org/drm/nouveau/-/issues/371

Regression reported to nouveau gitlab bug tracker. Summary:

[   29.686678] ======================================================
[   29.686680] WARNING: possible circular locking dependency detected
[   29.686681] 6.9.0 #1 Not tainted
[   29.686683] ------------------------------------------------------
[   29.686684] kworker/4:1/104 is trying to acquire lock:
[   29.686686] ffff9b5d15ce8520 (&cli->mutex){+.+.}-{3:3}, at:
nouveau_bo_move+0x1d5/0xb20 [nouveau]
[   29.686764]
               but task is already holding lock:
[   29.686766] ffff9b5d0b41c1a0
(reservation_ww_class_mutex){+.+.}-{3:3}, at:
ww_mutex_trylock+0x213/0x390
[   29.686772]
               which lock already depends on the new lock.

Bisected to 551620f2a3816397266dfd812cd8b3be89f14be4 ("drm/nouveau:
Drop mutex_lock_nested for atomic")
