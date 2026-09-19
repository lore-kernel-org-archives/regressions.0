Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A642DC76A
	for <regressions@lists.linux.dev>; Sat, 19 Sep 2026 20:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789851215; cv=pass; b=CkmTUeuwt6oZQitg1sQExUq/1fTt0Z6kprBb+UQf1YgNG4dB0UIf4+D4RRtUrWJza3Pg5nd68DWNyZBxgaq4AFX6J/REe6+dslFUxMOp5/xdSTK0icB6PekXDCXxsKYvgZRG0OnpGlH74v1Vo9y9AwzbQSQ4koSBC/6EdPkIgY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789851215; c=relaxed/simple;
	bh=1yDDpGk7UlB1XRm2igJPt/Nd5az01ELMWZVQ62sfJZk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=noDlHb04GQmKbXAmYsZqlLHzzHCTmrHo90YwzkGXO6afvTrfd/G+wyfHRy8JnfyvvQtzYJ3mNIVvr07OYFiQaADUqqUpSadBog95Q7wD2Lbe3/eki1qkFgHno8nO+9geA2mIay+e6Rx64Ak9NCj6PRUVk7lWSURr2s4Ovz+fWcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3E+ZU4n; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3E+ZU4n"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e211a0so2127128b3a.1
        for <regressions@lists.linux.dev>; Sat, 19 Sep 2026 13:53:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789851214; cv=none;
        d=google.com; s=arc-20260327;
        b=ShOu3v4wFokcQB9zgJv+8LSEnH0SuDreL+6mPvZGrr9Ho+h4frMLW2sVlCrBALIcIV
         t6+3bfAQY5MUc1NR+uxNYdnM3hxP1lIjbYTjqCDiv4qXhJZEgLVawxywPkHoyWKHIBBa
         8M8Dr4heQl1yzxAcYhm4MkZ3ymIcUzWUIjSZl/IHeJ5cGpe1gqkonGzP+WAYAhA4o5la
         OT/sLkr2ElIAqTwKrmY4MJ63/McEFbxLMlhB804XZo+S4Qtg8ODBSGaN1jLHgbRIfR15
         aOaSQHsOSBaoVR0Rsn0YayIabh4b5p0lCbRbjFg8XSAcUZq+G5aQuihpHsOfmBgxeZsM
         OOsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=1yDDpGk7UlB1XRm2igJPt/Nd5az01ELMWZVQ62sfJZk=;
        fh=UljlgNS0cMFjZRn6Ja04rO2z7hYBDuwT+PEqkxxlfCM=;
        b=VEXb27Lo27M2cKgPz3T7FD7PHdNdVwX+6RKy58H0JpJsJfG4UVTX7ErBZB3paMUsD6
         zKFLDzrtZdOtDXJPJzZq26VgknUmymYkVgbEZOQPaYEiZxdqyyqQppNY4+ZL3pILC2ga
         f11PFMMI4f8jHqJWP6PR1Lxfp5f86KFrsyG4JvrsCkpIdgbBj71g0IGcan+zV/hyQHPb
         3yVoLirFHd7V++Jt8ZPNtafJtQdJvyS4Cpm+Hfy47L/IRKcqZGJtJbbO51OUB02OzYdN
         JM+zNWfyy/CnYoxCIywT8Dzj27V42nZJwTtVl7SzakIpK6R40Vpta7izJV+2mZWc1S+G
         sydA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789851214; x=1790456014; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1yDDpGk7UlB1XRm2igJPt/Nd5az01ELMWZVQ62sfJZk=;
        b=h3E+ZU4nWHW2DAoa4DGD7sG/d05W9dgbbE8y7iJYKBo3M2mVjcVdwB7uJpwR/WYcI1
         CjUCydWnXMSnds4DUzhEW4QA0IkHb2RelMbEjUCvf6n41rQCeAtHtRACqxKTmK9fRM8m
         FhnXRT+ZSoFgelkmWUYX1EL8QcmFvOHbDB7fH0BlbOLbv4Ii9kQoHspGUDuOswsF9oX8
         jDzx1IIXe2oxVAn+UammUwCulVxy8w0HR8UY7d7eLtiQM5UyuyJ2mTrAillXjMCMpq8W
         K6nuAmW5p2oUeyR9Qs9toOyap86FIHHl2lb+6yWom+BZwE9d73+fjq0yk22UTWdE7JCT
         iehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789851214; x=1790456014;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1yDDpGk7UlB1XRm2igJPt/Nd5az01ELMWZVQ62sfJZk=;
        b=w+NaWAPpD3dR2f7hJmS9DUlEwKpT/T50d6fzX/D4bSux5nZCJ06rm2dDZOY+KvYcb9
         sQSTlTMhCe2m7cOn4YtCyRAix28HPsl2U7hS9THN7gYNhSDUO/zwHuVACLLJwMBsvYjY
         C6qr8uAxRXLD0MISaONFKO4hs6ePdg2Vz4ut58Cfwdkf06UmU6XiH/5IgUesoe9YPZl0
         2NGIwgRbitSawX/s2O1vRA2KNkGIxRjFqlVl4074Je7j8YPP8kSNl+bioFHDIkntip61
         9r1U8Q+HbzfPQVh1KBOJoZ9IAdeeca3CjdYz6SloBG5DvHQ3FFVaVj9BhD5mMUCW9Pqc
         zCHA==
X-Forwarded-Encrypted: i=1; AKwUvBz9lSQ0GLrNYwt8tRNn+jXcWjJZRuLVMH7lS6sQQmneFCy1tYkcQwfxDsRVU0vdXlGt2xHAn1y1Kyaz9Q==@lists.linux.dev
X-Gm-Message-State: AFuF++lF+4KnJvwX82XcEFkYbltpWvhRFjnxkJpiNgda0wOYgD3y6BXr
	d9KQlpa8eIf1bORAxQwz5McV2/rkflkedLUxRqootl8ZC6GYoIR2O98WeBXvZCuAJL+ystJOV9K
	EXC2ffpG8v3uWk3Yg/WW5vxM47gtCLiA=
X-Gm-Gg: AYBFou3B/Xpw9XWmqFqycKFDVCEEgBXBRRVZmmeXccJQD4obrh1iZz/CSU9G+6XLg8n
	dJdU43aeAL5fr8ZVTmgs0EDrg1HAjCdfDLd1FCJQS1b9Eqr2QVpNNJfkZmkVqTWoIhwNijklWpu
	cgD/Uw5YucwSwo9jz74+0ghriFErSfirMu7Iy8jfXvJFutMVJobcTGWYweEb2iv/QA8ina1rGI4
	iSyZMZhEMQEqxAps+Gt6vJnCxGYlQ847xTJ+Aq4NuuqabIuFJQkvRLGA49EqbDnymBSKcSc7Lp5
	zS4m1ygbqAWPlNfBkZVufjkGvOoDpDQov+zXhvdp2qAVBWwNNbD8ygxexJCzsUeAz//srsGeTN2
	Dfh+xXbeUdxVlPhRdAbqbaJBx4vdeJy0sN71uJ7l5yXkdOTwIqwI7hRA9oFV4AP0GYrTas1xS
X-Received: by 2002:a05:6a21:6b01:b0:3da:b089:dba4 with SMTP id
 adf61e73a8af0-3dd8c3fc826mr11732141637.2.1789851214024; Sat, 19 Sep 2026
 13:53:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: David Lomas <david.s.lomas@gmail.com>
Date: Sat, 19 Sep 2026 21:52:57 +0100
X-Gm-Features: AcwNN1VByzJrKqU7LMzWxWek7XyZ9CB60Q9hWtTQdOYL4Vi6JhYXo8yhZonG_r8
Message-ID: <CALjEBWT9wyBYtWPgtg8Xd_FxRU_XnatzQMcwMB9_P2Fdj83+cQ@mail.gmail.com>
Subject: Re: [PATCH 6.18 0167/1250] PM: hibernate: call preallocate_image()
 after freeze prepare
To: h.haechoc+kernel@gmail.com
Cc: linux-pm@vger.kernel.org, rafael.j.wysocki@intel.com, 
	matthew.leach@collabora.com, gregkh@linuxfoundation.org, 
	stable@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Same commit, same symptom: my report with the blocked-task backtrace
is at https://lore.kernel.org/all/CALjEBWQo0-Sdimo+aRNKUQvgDGw=jBFCcfwCXaqVdtoPrHLAQA@mail.gmail.com/
(XPS 13 9360, 8 GB, zswap). The hibernating task sits in
throttle_direct_reclaim() waiting for kswapd, which
freeze_kernel_threads() froze just before
hibernate_preallocate_memory() ran.

#regzbot introduced: 783c8109844503bd1c35dab41b6d5fd074a9f131

David
