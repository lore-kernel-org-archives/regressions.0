Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A38D334C38
	for <regressions@lists.linux.dev>; Tue, 21 Oct 2025 14:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761055271; cv=none; b=InBFVzbsYz/e/orCza/nSSlslhsJHw6108Dew+hbi68kn9lDporfE9DTurzCsMbzvHQjoNam+TP+n9KvtR+HxWe1euUu8tzzT+JBhsdOQRdO0YT5LcxJOJ5ZVp7GcicIfeQHcGWfmZxM85bqqQkh08S54DBJSAntF3B1BO0DrOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761055271; c=relaxed/simple;
	bh=FXZryhOBUuaH1agho0lX1ijHBCPEotwN/matuAtY8Kk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CJVYWBvVdZj5OHkWncy/fetLSj2QrxyU58kd4iJnsAU36R1IF2bmxJlUoWfyyzwT9zQ+Jwvcs1zclo5k6nsJeljSffzYHqXIhEk2W81rALLImKCcOYnZEqaPLK4p83d9JjGO1myCt27RAT0UqC0vM517uWfCBNql2EXRm0HLMAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surgut.co.uk; spf=pass smtp.mailfrom=surgut.co.uk; dkim=pass (1024-bit key) header.d=surgut.co.uk header.i=@surgut.co.uk header.b=aGIOyTuK; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surgut.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surgut.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=surgut.co.uk header.i=@surgut.co.uk header.b="aGIOyTuK"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b3d80891c6cso1287247466b.1
        for <regressions@lists.linux.dev>; Tue, 21 Oct 2025 07:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=surgut.co.uk; s=google; t=1761055268; x=1761660068; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3MlGVICVnwf2AbhcJWjlMkUKPriiyuKSWycGMTjAGCk=;
        b=aGIOyTuKYqI1avQu0rE47FzDPeJBILC0FmIuADZarl5EfoUUJnR6+lh1PgunA4FTXp
         fP9kZWV6fXcz85M2QNs6EyH8Xuevc/ngiELLYqFZZgn/MDlpXeKMWWIw8Mh7QlCrFrib
         KpdU7QRZMpqdRlFyZxKe1Z94mmqwr3sLAFC2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761055268; x=1761660068;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3MlGVICVnwf2AbhcJWjlMkUKPriiyuKSWycGMTjAGCk=;
        b=Ld4sX1ZBLcWVjxSAwBTJ3b8NFGnsPfbIO6SDxe01nMEjWHHHDChTvUNbSkFHtnp25R
         Ea/aUwlnhmGgMHF/RzcFXuvCCjOJLAm7m07QkUFUiFrIqM3i4WZdLzJ7zoBsZICr9UhR
         e957KiFXGABEAUKeV+tUFP3vEHmBPcWpPSXb2duckFQpmTeh7Mu9kKstwKvjU4uFOt4F
         gKZboSuSvaTySH2Rwujd8OVGudXiVPnJJxAsbs02W3x/Wy7ylhTH5/CmzBGNdKtH0hoC
         CMGYZ1BH9skkw4UBDkO/ty1iwk6YaP7kOdZcZmSIy2V0H6ADIon9sxQOrbZgF2LFx+Jq
         Qf6Q==
X-Gm-Message-State: AOJu0Yx7+sv+MYfPpWFD+bM1vIHpm8TnAzLysicF1Exshwk5IRYpU8+A
	JH+kgPrXbjleylFb//aKTwn+Zw9sYklXmCUCVYPkFvP/RtDRPgm0f+ciCvlDr4ZnByPpuQ249uG
	/HVQ88MNsfUkBXV5INKZbNf5udJpVag0z3REX19EJGw==
X-Gm-Gg: ASbGncvu/4eaDubMzXpXre6Z2wirzMHfZtbBul4P4yac7Z91f7D23Pvu0uxQipdn8vY
	DWoLdXBiUZNm/SV/Re7IVgD5Plhw1eueRxa3LcDNjYSoUgHFH6DTWsiAcc0smMPyf42tyNNRHTF
	XnGh0sv6wnIByTsvfm9t/JpCt+Mau47TAWkCIvRzcKYIu8jR7oEO6lpPbtp4iKngdYNulVZ+UIf
	qugvSTRUJgLcCEFRE4r/NfMHwJcg5NyT2W1qpvkmxIYa7EnZaFAWeAzBu++P6E1Gk34+UCZpu8U
	BC1yTmlpLXVSPCXP6p6+5wjGRaLG0SXyrhiqBkk=
X-Google-Smtp-Source: AGHT+IEhP7kVq9PE132is9j8ouoWPlUTOCUfix/DfQvvmp+psPK5aOtwUG+tYX99bgBwAgKA98hVuFKznDNuCl9gxCM=
X-Received: by 2002:a17:906:e52:b0:b40:bdc3:ca04 with SMTP id
 a640c23a62f3a-b6d2b8811abmr4888166b.0.1761055267731; Tue, 21 Oct 2025
 07:01:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>
Date: Tue, 21 Oct 2025 15:00:56 +0100
X-Gm-Features: AS18NWAtEPVdNCWM7Q2aPN08-btIALJJ-APjrT481FTu1EUbYgDb0SaJ1vbV5_E
Message-ID: <CANBHLUjPbXYghPx5zDwLDcGKXb7v7+1u-bpZ=L9r=qW7vDZ=cg@mail.gmail.com>
Subject: [REGRESSION] Secureboot violation for linux enrolled by-hash into db
 v6.17.4 and v6.18-rc1
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, masahiroy@kernel.org
Content-Type: text/plain; charset="UTF-8"

If one enrolls linux kernel by-hash into db (for example using
virt-fw-vars), the secureboot fails with security violation as EDK2
computation of authenticode for the linux binary doesn't match the
enrolled hash.

This is reproducible in AWS VMs, as well as locally with EDK2 builds
with secureboot.

Not affected v6.17
Not affected v6.17.3
Affected v6.17.4
Affected v6.18-rc1
Affected v6.18-rc2

Suspected patches are:

$ git log --oneline  v6.17.3..v6.17.4 -- scripts/
8e5e13c8df9e6 kbuild: Add '.rel.*' strip pattern for vmlinux
7b80f81ae3190 kbuild: Restore pattern to avoid stripping .rela.dyn from vmlinux
5b5cdb1fe434e kbuild: keep .modinfo section in vmlinux.unstripped
86f364ee58420 kbuild: always create intermediate vmlinux.unstripped

Reverting all of the above, makes secureboot with by-hash enrolled
into db work again.

I will try to bisect this further to determine the culprit. It feels
like the strip potentially didn't update section offsets or their
numbers or something like that.

-- 
Regards,

Dimitri.
