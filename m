Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF2A1E522
	for <regressions@lists.linux.dev>; Tue, 16 Jan 2024 20:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705437491; cv=none; b=qgUeKjKVx9sR2GTlNDMS+y90EodVF5ZVAoMPN0pYXht0jFEZ09HBV9ikoK5C6wnReCJDv8dXZL6xZwKelPId1fAewxmq4b8YLIJ/M+IjBIcyfbTJkKZGjBk91Hm8MImNtRP6umL3LQGo7DzrW+eUMQKdk77EoCCUrLeNuWME6pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705437491; c=relaxed/simple;
	bh=bWnVFvHAU4t6eKXS1KrLc7i+mwN8k/7L5hdAhkpCffs=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=hSKR13R6ZptAG0L/07yMVGNKYk8PIcxfHgi13NLeMy9Dlx7hsmT/EFbKP4jaCxemrPohVFu7D2hWuYmDQXiynM4XCe+RRZHM7Slt1mgRba0WQoax+BLu5XSy51BfBEjmcgHYJyijq4Bcu0/Dw8Tfz8nywyb9O5bt000tpO5wDjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwh0vOVH; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwh0vOVH"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a26fa294e56so1080500566b.0
        for <regressions@lists.linux.dev>; Tue, 16 Jan 2024 12:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705437488; x=1706042288; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWnVFvHAU4t6eKXS1KrLc7i+mwN8k/7L5hdAhkpCffs=;
        b=mwh0vOVHF8GIR4noksf52+TBpVpbpfQICdGI9LKoBkgEJAZX9lsAfICnBNedVhLG29
         JF3Ix5c6oghzCUOUq8juReb5tO2rp3nOyM8kOA9jQ7RkGuaOhTuANnWokXXqzacJivmA
         X+lXaF0kv2kChx5RU2+2pwK/hSuNdJIfy+URk9emWmNlAKSGvlTdn2hs890dPGv/ZiJL
         60imwVJkkfDEx5cdEhwSGy5lBVDIHp2Xl6YYdhFnaSiaIAAmHvceOkVXFUjPvdHm3fpW
         JSjLOyYjGq1K9LGVyoD59SB7DYjTikkHMQLIXW0IItcTM2CluoRY+9FlT4SLWQ1VoOPs
         jmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705437488; x=1706042288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWnVFvHAU4t6eKXS1KrLc7i+mwN8k/7L5hdAhkpCffs=;
        b=A+a7saxknykrJ5UmXbKI1bn0tlNCrCShz8ffw0czqhBTpPsauiqCH7bkhQgWuCQKpf
         dIsCBibqC3VzgPKRw3lH46H2gdmySUVD3xtLZrsox9uV+ZqiIgNLxJFteEofx8XLhLxG
         JiV6+VwFvj30xSfUBwfDhdL8pVw8Ar+PfxDqsXQzObiLD6LiXGzbce21dDkiSrqd4Add
         dpMKwl+a49oygWa9zOIfFMF9J1k6fsWhA9g4/Rw9qS5o/ebpwhdIWz332N1PyhtvkVrE
         oU2pty1Hnq5FzaLOI7KfAMR3gETOtBY5oTt3rYHUEgU04k1eW5ClhLn6ZnHxpag+pV+Q
         CxdA==
X-Gm-Message-State: AOJu0YwtNBJHwv35Zyx+knyhDV5rb8M1DC9+LJYK700VHbvQ1iRmYxp0
	wFjixQmRwrQ5mtJg26CcAoXhg6JoP2dzZTaNemc=
X-Google-Smtp-Source: AGHT+IEvBx4rDwsNBGd2mqiEDJRVE3qx9LAjbxEgjkdJ6l8w6IjqdmV8Dx8w64I3aWYy1V3hgfMwwIe6PwjnF/ZeWPs=
X-Received: by 2002:a17:907:8e86:b0:a2e:4914:cba with SMTP id
 tx6-20020a1709078e8600b00a2e49140cbamr1490840ejc.133.1705437487321; Tue, 16
 Jan 2024 12:38:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJvGw+DQhBk_mHXeu6RTOds5iramMW2FbMB01VbKRA4YbHHDTA@mail.gmail.com>
 <dae4bb032ad8b0c9fa6547de5e869e51f9f6e766.camel@sipsolutions.net>
 <CAJvGw+ATM3B09KbuLM0VsmU9GZRSO-ZP6ffwvvOa75xVHR3-kw@mail.gmail.com> <d14d6b4c02282d6ef48a936b1ac8be71c80a8835.camel@sipsolutions.net>
In-Reply-To: <d14d6b4c02282d6ef48a936b1ac8be71c80a8835.camel@sipsolutions.net>
From: coldolt <andypalmadi@gmail.com>
Date: Tue, 16 Jan 2024 22:37:55 +0200
Message-ID: <CAJvGw+BF+LWAzOKa8aJvGcdORWWjRDZObXupkCF5VAgSEm21nA@mail.gmail.com>
Subject: Re: [REGRESSION] 6.7 broke wifi "AP is in CSA process, reject auth"
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ayala.beker@intel.com, linux-wireless@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 1:43=E2=80=AFPM Johannes Berg <johannes@sipsolution=
s.net> wrote:
> so mode=3D=3D1 indicates quiet, new_operating_class/new_ch_num are actual=
ly
> the channel it's currently on, and count is 9.
>
> Can you say if it actually changes the count? Maybe capture on channel
> 36 using the NIC as a sniffer what it does over time:
> https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi/debugging#air_s=
niffing

If I keep checking it the line "Unknown IE (60): 01 16 24 09" seems to
always stay the same, the 09 doesn't change, it's the same today as it
was yesterday.

I captured the channel 36 for 15 mins, here is the 34MB file in
gdrive: https://drive.google.com/file/d/1yqDb3g3Cfttm4W-Jb5AA51nLQ7OglWhl/v=
iew?usp=3Dsharing

> Initially I'd say though that if this situation persists, then your AP
> is having some problems and we'd not have stayed connected without the
> patch in question either. If you want, maybe revert and see what the
> symptom is then?

I now compiled and installed commit c09c4f3 and its parent 2bf57b0.
The 2bf57b0 works great, connects immediately and I used it for 30+
mins, also tried to connect/disconnect 5+ times smoothly, no symptoms.
The c09c4f3 has the problem described originally, never connects even
if trying 10+ times in 5+ minutes, keeps outputting the same dmesg
message "AP is in CSA process, reject auth".
