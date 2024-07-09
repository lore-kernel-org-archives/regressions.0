Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB2014884D
	for <regressions@lists.linux.dev>; Tue,  9 Jul 2024 11:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720525805; cv=none; b=kPAvvZTtlrtR9r6UoJK1MkEAdqLxiW5UQQeslA5A0zIW2Rh24vK5CUE8Y4SIXybm7rGNIdl4pUGfk4KuGWSQSVSRk9ZD/mEWEl7qba8g300ajHZE+nXfMbbyc73EqRMOiRqnbnoq0HNVKsy9KS8GN//san+CLwB4HNBOzSjNF8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720525805; c=relaxed/simple;
	bh=lNlid3H/kN6Odo1mBwFYYrRtvNdI/Uorb7eOHuXh8L4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Auxz3Yw5qezgUwXm8fLaJ4WjN389+rrfDAblkR8bBraShLXhBXNUMPmh2AWI6XWixp27n6baLdDzJ2DF0btBvLqGdtXR3J1ypfYM6b7kToet6PtRfNASr+PKJleftG9HB0DTm4Yo+g7AEK2G6Afku3J4WtWRBx/yXkHkXPtDlCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aibK6RVL; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aibK6RVL"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fb72eb3143so18523365ad.1
        for <regressions@lists.linux.dev>; Tue, 09 Jul 2024 04:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720525802; x=1721130602; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MRGbhkDfzuBSO1BGfrLFHwF8BBPQc55G/CgkIUBsVh4=;
        b=aibK6RVL7HL4jR93ZBq2SV3yaTn+mZejFu5g5+aEoQPfX/5rZSVEJ93jOKoo6UuUE4
         ZSA/c7HdZoNIrH1AsPLorQvGIGjbdHyABu5yxeyB1I50ezBlenAEqUVp0wFX08kQojGQ
         zTHjtZ7c61ixfQyY0zZVKhU//P/9n/zQTsaGGl8UJgr3tbWOERo+MFA+bVw4Mt9eTszg
         IWUsTEAMp+L5Ug4miZ7cjB/3iS6GmmG1H6dosZuQCYTdvyOPsyWfL5J3/Vfym6pLdPQk
         k2qZcy0WgPvtkQgRIwnYoRlgjrvsbbes2Su8XB9+J8egk7oa50MGT7pxzc8AnDSdaXb1
         mLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720525802; x=1721130602;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MRGbhkDfzuBSO1BGfrLFHwF8BBPQc55G/CgkIUBsVh4=;
        b=CfhoQOpe3WMAyd8PXOjyc3mUKWh6x1NsTlhMrGwhmSXCHSe8hymVVEp9Na0v7Moq0V
         R/pk3vOSI09mIYLvlkpj0ubuwa+OskxXP1EbcCCB6ESVDCQNotKDK6Fh4wE/M3hx4DMZ
         OsZC6gZVN/+rZL9jtHhC0rLQZIOek4JoJ/Ou1uGyWGFSMHMaBh5fXwTUFH4LCiNlubIA
         pOv8H0yLdPUMw8KLtr6gCkDVRm/lyH3J3+DAkhZiolz7iaD2otEMH7c0QpagdWb/+WPm
         ReTN8uaM5Cx2MupRwbHORMpdWVOPBOFE904sS76EBe4efIWSC3SylW8uCd0pbue6U1Lw
         ib0w==
X-Forwarded-Encrypted: i=1; AJvYcCXWJ88AHP2dpT3lB7R3trTlZuj7ap/0TcbGH+CCprFB5q51Rdy2ICCt+Cm+S0Fi58eI9OQTH4JkYWh3U78AAcz/j1YlZ9T0cjOmDtc=
X-Gm-Message-State: AOJu0YwAji6fz4ltgxgQCtj8gUQ2ecOYulPdDzWMfpO23DvbfmLPe7eG
	S8Uow9C1stDg5CDWpD4e+1jLK4H3gp8UVSSHV0UMekLB4UuBub4X8ncnLtQL
X-Google-Smtp-Source: AGHT+IFbcw5Rbnlg5vNsawjDtxjUrTIEdZVU+0P3B3/uXitWW7pGl52jTKe3eD0Jktlg0ppOD+QWKg==
X-Received: by 2002:a17:903:2bcb:b0:1fb:24ea:fe29 with SMTP id d9443c01a7336-1fbb7fea2e0mr26955925ad.15.1720525802132;
        Tue, 09 Jul 2024 04:50:02 -0700 (PDT)
Received: from terra ([122.171.22.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ab6d3bsm14372405ad.159.2024.07.09.04.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 04:50:01 -0700 (PDT)
From: Forty Five <mathewegeorge@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Bernie Huang
 <phhuang@realtek.com>, "kvalo@kernel.org" <kvalo@kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: RE: [REGRESSION] Freeze on resume from S3 (bisected)
In-Reply-To: <e9c35b3d72a34c8e8ac607590917681a@realtek.com>
References: <draft-87msmrdgkb.fsf@gmail.com> <87h6czdexm.fsf@gmail.com>
 <6673a2dc01a941f5900da7393d160005@realtek.com> <87o777tdbw.fsf@gmail.com>
 <e9c35b3d72a34c8e8ac607590917681a@realtek.com>
Date: Tue, 09 Jul 2024 17:19:52 +0530
Message-ID: <87o776g4yn.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Ping-Ke Shih <pkshih@realtek.com> writes:

> The commit date of culprit bcbefbd032d ("wifi: rtw89: add wait/completion for abort scan") is
>      CommitDate: Tue Jan 23 13:38:15 2024 +0200
>
> But, you want to apply to the top of 57f22c8dab6b whose date is 
>      CommitDate: Fri Jan 19 13:49:16 2024 -0800
> and doesn't contain commit bcbefbd032d, so no need to apply [1] at this point.

Ah, I get it. So, from here on, I'll be applying the patch only if this
command returns exit status 0:
git merge-base --is-ancestor bcbefbd032d <commit-to-test>

Bisection log so far:
git bisect start
# status: waiting for both good and bad commits
# bad: [5bbd9b249880dba032bffa002dd9cd12cd5af09c] Merge tag 'v6.10-p4' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6
git bisect bad 5bbd9b249880dba032bffa002dd9cd12cd5af09c
# status: waiting for good commit(s), bad commit known
# good: [bcbefbd032df6bfe925e6afeca82eb9d2cc0cb23] wifi: rtw89: add wait/completion for abort scan
git bisect good bcbefbd032df6bfe925e6afeca82eb9d2cc0cb23
# bad: [480e035fc4c714fb5536e64ab9db04fedc89e910] Merge tag 'drm-next-2024-03-13' of https://gitlab.freedesktop.org/drm/kernel
git bisect bad 480e035fc4c714fb5536e64ab9db04fedc89e910
# good: [57f22c8dab6b266ae36b89b073a4a33dea71e762] Merge tag 'strlcpy-removal-v6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux
git bisect good 57f22c8dab6b266ae36b89b073a4a33dea71e762
# good: [43a7548e28a6df12a6170421d9d016c576010baa] Merge tag 'for-6.9-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
git bisect good 43a7548e28a6df12a6170421d9d016c576010baa
# bad: [8c9c2f851b5a58195ed7ebd67d7c59683d1a02bc] Merge tag 'iommu-updates-v6.9' of git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu
git bisect bad 8c9c2f851b5a58195ed7ebd67d7c59683d1a02bc
