Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD254611E
	for <regressions@lists.linux.dev>; Sat, 25 Oct 2025 05:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761368907; cv=none; b=JqsCNpva0Bmjm/dSspcsyHUmlnMcRUCUGq6pjTxZdTj1f1jhzN3jUWZ7bbSMG7rLCBbBMBvBxL/03324zL+J+aDovsdywCOtosbUlqsruLgog+qRwMRoe6zHoHMDulU7nnMCn141QkqfDP1cLaX7Sqk1ZtJb042L8yNSBbwdUjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761368907; c=relaxed/simple;
	bh=9sj97WqdM5/emB5ZezWNh1O1KphVBD/fj3cCp/SxgbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SItKnhCGwWwhF2xhDBOoPUBh8d9m5PLrwM5/lCLeR8dlj08v0r7sM8y4TgvagIuUtXY0+euEUgvL6VG+BrzyXLoufwiiLvkSpMPVFvZPPL2qkLJTkaaHW4c6s9udW4s61G0t4RM68Cd06xifcNCVDa2GA3jQhX3iqsk/JLJ5+sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1qkZ2Us; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1qkZ2Us"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b6d4e44c54aso482201766b.2
        for <regressions@lists.linux.dev>; Fri, 24 Oct 2025 22:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761368904; x=1761973704; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wyvOizFeamc5J5XjDLMeHypdnVLhvC3mQKcXmMz7GA=;
        b=U1qkZ2UsLCIKPwxzceCYSOqXElBe1D/5UU/PQysPzfjBlL66dIfgXQEtOvxm8slHMi
         ej4jCZ5DWe49U2XQcU86dubOt9v8X4ETz+uecYlOj2WPiCHGjmJy1fRHFunLeNgFme8Q
         9iI4J3bMl8SuTIkIM/JKW2DQg7iON2rkK8JbaSMLJIMo+OdcG2i37asBHIVj9ucveIdQ
         FlAQmppkq0XmcNSqpz7MnZP3dj7J4QgRVobqpckIEGo1P3bt+zLmlD3ZarakVYsme9uO
         nNGgUl6RmqLsxGFBkLVh6HE9sIa7nDanGsx1iTGLsObj8mdGcRUCts4qa/1EzGYOkq9m
         72ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761368904; x=1761973704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wyvOizFeamc5J5XjDLMeHypdnVLhvC3mQKcXmMz7GA=;
        b=Of4hcOCHJbaZwvOExrMNUWb/i07TIDfZVGfyLYrr/RcZ9KacgmFTl6q03keJrvS4qh
         cWejEVVJ30Mh1xXEtSL5qRiyRYQkbAElftIsfCiSznxburlz08BUzMQl0KSJ9zI24fos
         LpsLh9rQxaVQzWHt8cYTuoMa2Ws7C5TdaZqHanH5JlCxO1gDqUuo2A5ouzpmHcsiK8XC
         Coqzbf0699SzbmHXd/e6kJrD3Lp3KFNzXuCH2lq7+dWPeSdNau/hgYIEOL7jbjmeu4XG
         EO1F0SNV6KuWZfTNe/XXWARvTicP0Q4dMblfMc9f7xTuYiHCHyQ0Tsh0wU/ejvc+Vbi0
         Wf3A==
X-Forwarded-Encrypted: i=1; AJvYcCWfZtZkfUjn2rRSTWBgMH3P89Oqr/zL5iSisRJyk2czHnYGW3Mv6EuLUOxWhfkVGydBq1h5XTX0fc4oLw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNyEWLriUZusi9oyekMr122N010OU9rqL0GH21Ayu04ukVaaLa
	+OHLY3nz1oHMdUoDZwd7phLQUqUmPux/A0z/EMzVaBlxXuRQhdbd0LM9
X-Gm-Gg: ASbGnctyAJK1o9iD1b0AvkCuHPG9tOLZoP08peDpPxxVJhD+L14ocBZnmR9S/I7LfIC
	p3B2BcYQKv9rFXEo8SevTsPRQpCGiHHJVxwsWWxFpgAj3I0Hv65VCoXIAhKjaijP7KEQV0uU8XT
	I1DM6XwUHky2nAXNWgyDHCMDSCCn+uEdWrgAndBfmjjClpXziUzevJmLHxlaqjye0ldX3dcBSSp
	DR4PCiR8qWbXn/g7S2lsQu1mOPM5Ug+1wyyxXx2Ctz2IDcSrVHCrcCZ7c4rcneqDiJjCDWuxXKC
	DQjzHORAk7ulKgF9xjoM24LaAbjMLgIZwih828ep3DYWXpkcNiPtQyXJhnfCpgoKLiWiUrc88MF
	+60kQqLWoydVy42vmJeFULXqSfwz8mufPILauYZ9oACR8m1Iox8giGl1hipRr/Bt/tU52Gj99XE
	MS
X-Google-Smtp-Source: AGHT+IGED30i/rKdoHj02khe2qIDFQObvhJ3a36vUQHMrmoCrPRoG3pb3BVWX1cfcmX/8CsErsWK4g==
X-Received: by 2002:a17:907:9615:b0:b6d:7859:61eb with SMTP id a640c23a62f3a-b6d7859620fmr371817166b.29.1761368903851;
        Fri, 24 Oct 2025 22:08:23 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6d853077e8sm102873866b.14.2025.10.24.22.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 22:08:23 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: rafael@kernel.org
Cc: gregkh@linuxfoundation.org,
	guoqing.zhang@amd.com,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mario.limonciello@amd.com,
	todd.e.brandt@linux.intel.com,
	torvalds@linuxfoundation.org,
	"regressions" <regressions@lists.linux.dev>
Subject: [REGRESSION][BISECTED] Hibernation: WARNING at kernel/power/main.c:48 pm_restrict_gfp_mask (was: "[PATCH v1] PM: hibernate: Restrict GFP mask in hibernation_snapshot()")
Date: Sat, 25 Oct 2025 08:08:12 +0300
Message-ID: <20251025050812.421905-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <5924662.DvuYhMxLoT@rafael.j.wysocki>
References: <5924662.DvuYhMxLoT@rafael.j.wysocki>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"Rafael J. Wysocki" <rafael@kernel.org>:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Commit 12ffc3b1513e ("PM: Restrict swap use to later in the suspend
> sequence") incorrectly removed a pm_restrict_gfp_mask() call from
> hibernation_snapshot(), so memory allocations involving swap are not
> prevented from being carried out in this code path any more which may
> lead to serious breakage.

#regzbot introduced: 449c9c02537a146ac97ef962327a221e21c9cab3

This commit introduced regression: now I see WARNING every time when
I hibernate. The bug reproduces both on real hardware and in Qemu.

Here is script I used to reproduce this bug in Qemu:
https://zerobin.net/?aadae7117a208c0a#Xh8aI5+u3pyk+vKwET7j+yXolLeoSLe/AedcvnNeCLs=

Here is resulting log (dmesg) on current master (43e9ad0c55a3):
https://zerobin.net/?471d17d0632e7f85#uYne0yUu+rP4KnDbOFFqtCrcDIi6UpQz2uIQw85lcdQ=

Here is the most interesting part:

[    1.735001] PM: Image saving progress:  90%
[    1.746611] PM: Image saving progress: 100%
[    1.747208] PM: Image saving done
[    1.747403] PM: hibernation: Wrote 30164 kbytes in 0.13 seconds (232.03 MB/s)
[    1.747837] PM: Image size after compression: 8908 kbytes
[    1.748190] PM: S|
[    1.750351] ------------[ cut here ]------------
[    1.750627] WARNING: CPU: 0 PID: 1 at kernel/power/main.c:48 pm_restrict_gfp_mask+0x3b/0x40

On real hardware exactly same thing happens (i. e. WARNING at kernel/power/main.c:48 pm_restrict_gfp_mask).

-- 
Askar Safin
