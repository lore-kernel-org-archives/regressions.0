Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2300586243
	for <regressions@lists.linux.dev>; Tue,  2 Apr 2024 13:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712065378; cv=none; b=Z1vROWaZlirOcNg86wTFUvRZPGMdnNhIVKa2VdPILIFfHBE7k+5gobAIcetziBBYfV+1kV2SWjQg0gtBLA3WClNYKGtCXuSGTn3F9c2N/boBuWd7Hat0YYfrrde6N48cQKutxDV7ckM1tt1yYsDt0UuSFYBPr/qgDNgQrkO5Q8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712065378; c=relaxed/simple;
	bh=i+b1uHVl9rRn+1rrSUi2nuadkeRDlrk+KQBy0RwN1AE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YeHmV0gjq24jf3YDQQyQjxJ9NMPGmw0wX0j/kSXHf15GaZp56Tjrjoo50PqPfHyCxC4OyLAIJRiLEcycyTqz1BYg5vIvSJvKKUSuGG4psb14nJHPuVyRtr6NjUTKaUmdX1T9J4Dr1F1pJpvZSQ4Fiu8RmtuNf08UxClxXBYmX+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u4Xryo7j; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u4Xryo7j"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56bde8ea904so62870a12.0
        for <regressions@lists.linux.dev>; Tue, 02 Apr 2024 06:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712065375; x=1712670175; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+b1uHVl9rRn+1rrSUi2nuadkeRDlrk+KQBy0RwN1AE=;
        b=u4Xryo7jKkXvjgZbXA/Yq088mzQOegqNF6/fM024iaVSNWW6XVICsGcc4lD1OBa6hT
         azkp/P/4YmP3B7U2AC07LLHK0tr63F2w9+uKeOLmm4h1HSoknzxZdSPTbXsqROxObMpU
         a+OWaxPvpgxSYldPmDDfEAV7AcGIcBhffj9/NRB4w+RrNCFTP5/LdTgd199U/Dbvlnoq
         jEAXh2fqZS+Ou9og7ujZv1Ry5uEmRKn4gI1o9X65mC0f3eFyrKSP22IuyamBhX72z1Ws
         CI0bNkWY8QCSDWq+zPNU2JYbaKwrT3N1U9BiPRcz+nkrM4mdpCkNG+1Ae7QD+VyuHsWz
         HA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712065375; x=1712670175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i+b1uHVl9rRn+1rrSUi2nuadkeRDlrk+KQBy0RwN1AE=;
        b=CnBcdCAWjRJ/HMZHFepN1fC5Svux6UAMBxjbWnoZjRpm4h4W3CBC7Dt2i2MSaafkTb
         J8hULgSIEqvIKimiB4LYI1yrXKpOvDcO/jK82Tfzrj+fxGKoNr6m6k+01XbXd615X4uP
         BfLqCEoeX+D/ooLtmeD+TzatIbHpOVglt6p9RzFPpNAXUlCHo7sXz6c76+4G1Wda/gn4
         pHhrLUbJ++2Q90vJ3fWzi7SpzPMMD+iwYP3MiQA0Bj2UvdOLfM5ql5eIbp7wXMpMPxHv
         bB8yeQpJmd7s7wW6KYk6+0NynzJE/9x5u4OWYxq1wssWz2vGiNm8XE/vszTyL4TFigdI
         Y1vg==
X-Gm-Message-State: AOJu0YzU8cZs3WAWEknIHyfNYMedLUvPFziTNymfyXEhUQkCKN9G6ChD
	rJCReGZXF8Emep158S3UcjA4lohkA11VvW0pvWMyw42sN8llgDthwufocmiBpcEU+KqgeHhJ9fk
	44g/u+PAbnyjLOY+h259mpOQefOYZLfwYjbwGQLordRco0B+npQ==
X-Google-Smtp-Source: AGHT+IGhJs/xxLuIQ5mlNdSVPp6/sP0TMNItnsrSUwbE9ucDH0CPqmo3gxOVreWdtd51AqX7mTFBgMz53LdQb8hx9z4=
X-Received: by 2002:aa7:c752:0:b0:56c:522f:6799 with SMTP id
 c18-20020aa7c752000000b0056c522f6799mr552042eds.5.1712065374969; Tue, 02 Apr
 2024 06:42:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240306111157.29327-1-petr@tesarici.cz> <20240311182516.1e2eebd8@meshulam.tesarici.cz>
 <CANn89iKQpSaF5KG5=dT_o=WBeZtCiLcN768eUdYvUew-dLbKaA@mail.gmail.com>
 <20240311192118.31cfc1fb@meshulam.tesarici.cz> <764f2b10-9791-4861-9bef-7160fdb8f3ae@leemhuis.info>
 <72e39571-7122-4f6a-9252-83e663e4b703@leemhuis.info>
In-Reply-To: <72e39571-7122-4f6a-9252-83e663e4b703@leemhuis.info>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 2 Apr 2024 15:42:44 +0200
Message-ID: <CANn89iKfMTGyyMB-x74J5bgzhM1RxSvuNhvXyWWv4DO8MZakSQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] u64_stats: fix u64_stats_init() for lockdep when used
 repeatedly in one file
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: =?UTF-8?B?UGV0ciBUZXNhxZnDrWs=?= <petr@tesarici.cz>, 
	"David S. Miller" <davem@davemloft.net>, open list <linux-kernel@vger.kernel.org>, stable@kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 2, 2024 at 3:40=E2=80=AFPM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> Hi. Top-posting for once, to make this easily accessible to everyone.
>
> Hmmm, looks like Petr's patch for a (minor) 6.8 regression didn't make
> any progress in the past two weeks.
>
> Does nobody care? Did nobody merge it because no tree feels really
> appropriate? Or am I missing something obvious and making a fool out of
> myself by asking these questions? :D

It happens, please resend the patch.
