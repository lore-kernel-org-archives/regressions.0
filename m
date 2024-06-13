Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A77149C79
	for <regressions@lists.linux.dev>; Thu, 13 Jun 2024 17:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718300180; cv=none; b=FmZksS3PNxCBPX9fbM/8TTb/+xgoZx02/wviQo+tEEtqPfLpAEVQS+tUH8xabcm09pQhXpa9S+bT+0sdYdFKI/Su+8m17t1qs4RpDWosUQiwYJJqwcSsmgDscjROWxh5d2HThgldOWQ4SWlT1FsOoBQlVblRNlz8h/xW9eKJM6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718300180; c=relaxed/simple;
	bh=wpYAeO3qLDmEbVwjk+bLqgGvh+uERDkZc9Q/nNwO7LM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y1i/kEEm+FZ33E0ghXoWzSTEjUXMmVupcaZFvqrbioc3mEHLvpKN4y6fsJRYn8B0L4QqfJGNAELZSMONFCril6RXIqLIkWkJBS8uB6MKfiCyTwcTabriQAQ/dOHmgIRT7mvYRKAtu0hTnq87p5KTP/D2mqjLvl5rQZM2lwu8Aho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=fE2+e6Np; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="fE2+e6Np"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dff13c4cec0so230014276.2
        for <regressions@lists.linux.dev>; Thu, 13 Jun 2024 10:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1718300177; x=1718904977; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GErvgxd9rMF9jDiySOwKqOC0vAMN90Lf+q/hWMcRinA=;
        b=fE2+e6NpA8b0HNW23OWX+CLUAYRq4BYO36yw8HFH/xAciysL5/wNUxFwfNE26rR6Kq
         12MlTVrPZRxpSPcWIf7itEUl5vJLFwZiyEXnCuGx0P71XatA1WId0KGIHB1mO6yn3do8
         XtF+Q2zgWEUchJkGtLItlRjL1dHCHdo18Q9ziKDe5bKnNRc9acahH9pn01/oTSdO5X7o
         rtKJr+UKkilqQ8fj+jKjhVwd5YCmTFlK6+5ikQmDuXOKjuy6vHcTBp9p8xkECxTdA2Ki
         B6szU//es9V0s1p9BMZPql5ig+WVmrMMOcTpMticz+Y40qZI3HDC7XYy/O8uuGoo/hdV
         7Dmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718300177; x=1718904977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GErvgxd9rMF9jDiySOwKqOC0vAMN90Lf+q/hWMcRinA=;
        b=mnN9yg7moTNa5+8qZfeaVx8223vUydPVQMdM479ydcq/dLAdGOHv2Ew+K8Fh4NCQML
         BmWiWMBAmB8VfTtjR0MhcfobJBuZi6BfQJHpLwL0fsPxuzdb5FV4bvzDcAcfzM78ueRi
         SUV8OEobqfZI9AEEywnbs/qv9Unm6WR/OLPj2gwhBDTI7Qk4kcXFB0VNRp6Ai7SxCLPc
         kjgABDsiljXWWsdmo67/XiHc0dDb6WZ7mudFSsXYsGEAAoQQJs/p/83oDmwI4eSI3yDn
         AUWif/3eGw3r+fG1HTgxao43EOI5j8sbtKY5ibnsvn6dGpyI28KGeY+nItf8bykRfLbe
         oDhw==
X-Forwarded-Encrypted: i=1; AJvYcCUk1IUruEYobzQ+8L4UmMyHgw4WMpKyWc7WmPyJ32zJT0lxxPGGw7YdkfxT/3z7ZUHPEaTvEPw0Btmbcg2X4jYerViMIZ1O4tUpqUw=
X-Gm-Message-State: AOJu0YySiqW1jJHmjqWaXWfJAyTBVFs//RDSPHBXeNLuULKxU3e/YuF+
	TYb3AXSuAYronzpAmEdKibi64mz//xXU0plfK3QIStFHSs+H829G8kyrZvtC+mWo9GJ3g8cXkWr
	mFJiuoof5+YAwxpjOu9DXJq7OZeKP/O4AgHFC
X-Google-Smtp-Source: AGHT+IFHmbiArDsXZWAVYs3rjmdh3ys4tk76bUfvWftcy8jvKjto9zOVodRX/SH/AwXV4pGdCMt5fhvB8xha1GEmN7I=
X-Received: by 2002:a25:260b:0:b0:dfb:d69:5657 with SMTP id
 3f1490d57ef6-dff1534f118mr168388276.9.1718300177648; Thu, 13 Jun 2024
 10:36:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvWXuWyd3NiX3WwRyorRiDRbxGmRW_7aVnBVKUVA_TaGg@mail.gmail.com>
In-Reply-To: <CA+G9fYvWXuWyd3NiX3WwRyorRiDRbxGmRW_7aVnBVKUVA_TaGg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 13 Jun 2024 13:36:06 -0400
Message-ID: <CAHC9VhSeNGo4fPY0H5eM_fFsPSQ18xWUYMvyHBChEysXk-+00Q@mail.gmail.com>
Subject: Re: security: ima_policy.c:427:17: error: too many arguments to
 function 'ima_filter_rule_init'
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, GUO Zihua <guozihua@huawei.com>, 
	John Johansen <john.johansen@canonical.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Casey Schaufler <casey@schaufler-ca.com>, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 8:43=E2=80=AFAM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> The arm and arm64 kselftests builds started failing on Linux next-2024061=
3 tag.
> Please find the build log and related links below.
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Thank you, the same error was reported by the kernel test robot
overnight.  I'm going to look at it today, I suspect it is a conflict
between the LSM and IMA/EVM branches.  FWIW, I compiled and booted a
kernel using the LSM changes yesterday without problem.

> Build error:
> --------
> security/integrity/ima/ima_policy.c: In function 'ima_lsm_copy_rule':
> security/integrity/ima/ima_policy.c:427:17: error: too many arguments
> to function 'ima_filter_rule_init'
>   427 |                 ima_filter_rule_init(nentry->lsm[i].type, Audit_e=
qual,
>       |                 ^~~~~~~~~~~~~~~~~~~~

--=20
paul-moore.com
