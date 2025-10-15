Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069321D8DFB
	for <regressions@lists.linux.dev>; Wed, 15 Oct 2025 04:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760503071; cv=none; b=fLyGvGQPknrEG56vkw/oFwSk49zPQwIoyeJ7qEjqoiGv5zzhPbIzH2WOO+obLC7uRm9vK4jbtQbVPvS4kxy2lolTMTpXyAfbaxy20Ug3sWnnxBh77Iq2eELk1kmgUk9hX6jphtgto7HXVrH1ggazlXNlPfSSw/wsDGkb6f8Eb0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760503071; c=relaxed/simple;
	bh=IWCztCQ/8hCoDWgdnkjTiHYb/pPWi7Kgb2ANzJjNT/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fVkt+Vcv3XaKCTeMVipm8Fk8zQU66PnhhxvqzZj6ge8rvUfnIRqOqSr2U9hyVzdClfWhOyctvDshdzaNm1L5Xnk+vBucLJ5VhRneolciLCPfaTPi78g5w+1t8XCLXJJnk628PdOx1xNvntTgILmPTWpJmMw0KgjaH4nlF0Jq6Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J19+LgOG; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J19+LgOG"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-633c1b740c5so6207007d50.3
        for <regressions@lists.linux.dev>; Tue, 14 Oct 2025 21:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760503069; x=1761107869; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWCztCQ/8hCoDWgdnkjTiHYb/pPWi7Kgb2ANzJjNT/E=;
        b=J19+LgOGKHXYIoo6dLDJx0ronrclOIUWHIpi8KdYdhExP+JlqwKMvgjl3vsPloNXtk
         Hq4Q1cGZ1ZBPFbZqlCQgmU9JJojQ2CNrVyedLY0GmWWEy1xElgbpcVVyd7uaKY5hbE2F
         Iqs89DFqwnDSyClwFXcojdKVBSz6yVHQwgKCK805hLM2BFcqhCbVk9dpvRXrqsyB4kK2
         ZAtEB8g9557M3i2245eK8HWrsUiKpO9SjfHhoxgFlAtf73XLo1lll1X8R2WNdqVAPzdF
         Mr9kPwgZm3CjUoc+YwlKMfkMmVJKXaw0JuL35P31VbQa82oKGLxq94CReG+cMMu5HTqS
         lOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760503069; x=1761107869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWCztCQ/8hCoDWgdnkjTiHYb/pPWi7Kgb2ANzJjNT/E=;
        b=aU54+NDbbnfPhp8+oj9Mh86obJcikEMMSym8E5uA7wTihQcji7KFhiRwaql8YE88Rb
         OAgOn+nwxMgIs0UDsBQzB0e4EH8Vhy1QE0aodpeXS3QdlsA+bq2OG1mAo0XPNVzXNJvE
         GiGHnJmgYv63QFHuq59EP5+oKmKALDH8VE9oqiHHW06o/TI5VSYPJ4hPQ0pWbkFrz5VH
         fYcE6Y6x41qyfeocN8eA/FNrpnmuDTiCXi48ebrDgEGAr8LSlPfMDyLVHb1SAWWAFDpQ
         T/NfYc7HuY1NsxXJzWpbvGqSzvt/j7UeJTFYepbNrG157PefR7C2+l0ZIMK9FeiDvZpX
         t6gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGZZY6Oo0FlzzNygxMpzng9/QJyiu60ZUxMvNUjD+bm81cMpRGHIqaKAUKnCfqvXLej2B4A3w4mK4CRA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWd0B8pDm9+S9z77u5JY6SuLLy4e3AYylvOutdBJzh4jWGQh0G
	TClIEnI/bzEA2eqj7u/lAKa1rNOYDHoIFXDHHnCXxoNRHP9/mw9Qa/3npYbPsxk9s1RdG5Z4ddG
	Om1ZhNxI46k/Qc1lolkgagO2+nRx50is=
X-Gm-Gg: ASbGncuHin429+2H2hKPxviTF9Kj6+zSZ6q0p28jFYuVGatI0GjJ9jwp1hQT/Q/WU19
	I8+rFZJ185+Dfy6dw7RQYNs27BMF8usRwusd+RfYal177rfRA+GqDRhpvoL5TT09WDUXdRHDd+a
	N9hjmJ/ir1iTEb6MN7kJX183e81NpXeulpAsoewmIApjI5qbHELQsTKQi6wJn5ijZyAV6b7iJ3t
	pXkMUmDpt35hly8HbJ8J426iA7jFA==
X-Google-Smtp-Source: AGHT+IFGTphc3y11MB/LxyjmRa+A++DJ0JzpQeR4zZW+As7fGgAafakNDnSFAXBdte2IbD/92CmJji+KpScnDU6qqV0=
X-Received: by 2002:a53:ba50:0:b0:615:620d:6a52 with SMTP id
 956f58d0204a3-63ccb932bffmr17205947d50.35.1760503068926; Tue, 14 Oct 2025
 21:37:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250709160434.1859-6-tiwai@suse.de> <20251014034156.4480-1-safinaskar@gmail.com>
 <875xci81dt.wl-tiwai@suse.de>
In-Reply-To: <875xci81dt.wl-tiwai@suse.de>
From: Askar Safin <safinaskar@gmail.com>
Date: Wed, 15 Oct 2025 07:37:13 +0300
X-Gm-Features: AS18NWC0RovV7keECU9wFyrJog3woEwrMZoFAlIQ36YocePVNhOZmghPOlc0z-s
Message-ID: <CAPnZJGDffiY-9sBTfdOYkkmjQqb79M3d8uLdyyb6eAxU8fqbuA@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA:
 hda: Move controller drivers into sound/hda/controllers directory)
To: Takashi Iwai <tiwai@suse.de>
Cc: amadeuszx.slawinski@linux.intel.com, baojun.xu@ti.com, 
	bo.liu@senarytech.com, cezary.rojewski@intel.com, 
	kai.vehmanen@linux.intel.com, kailang@realtek.com, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	rf@opensource.cirrus.com, regressions@lists.linux.dev, 
	Dell.Client.Kernel@dell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 9:04=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
> The oft-seen "regression" reports for 6.17 were rather the incorrect

My config indeed didn't have CONFIG_SND_HDA_CODEC_REALTEK.

I set it to "m" and did test again.
And audio still doesn't work.

My new test was on v6.18-rc1. Here is my new config:
https://zerobin.net/?93d5992bfc6b71fb#t3wlNqOtO4CA68ixHQA5+20xXFAh009/I0d4S=
lIpS9A=3D

--=20
Askar Safin
