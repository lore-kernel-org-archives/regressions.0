Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE432773D8
	for <regressions@lists.linux.dev>; Sat, 25 Jul 2026 20:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785009892; cv=pass; b=Kwyv7WiTWng73hpZq6Bsz4lZN72BcXu1LKmXsgkq6IYZ2czNDEya3Y14JBMj6VrsIrhOn2jwwpgnwtBTPNPPcssKqV5Gc3Jug1184n+6Ana1znVA376wte76JH08Y+vDi7Z/X6bvyu0qzRg7yJB73G+afL+wjzz99XZs/Tw/7+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785009892; c=relaxed/simple;
	bh=bcPVB4CzlqB28Ue8AlWpUy7elcjnmEJZl5D14wdfzG4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=GQ0qw3r40ApxABqGnMqvC328VLfiiQJbAkPTZyS5ktwrvUE1xtJNXybINbIleCC1FsfScV9c34rvrhjpTWm1EC22BxlAL1RqdsNbXgahwmAinNrIkdJ9DD6Z6Xm1hbf32wD+E80vPQhhgKglOf3//6pdqTyhGzBfXuBR8VmjqGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SoxTWwdU; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoxTWwdU"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca80d708489so1011962a12.1
        for <regressions@lists.linux.dev>; Sat, 25 Jul 2026 13:04:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785009891; cv=none;
        d=google.com; s=arc-20260327;
        b=W1KspnBaXiVZcDgFjqrNst3iWHnAdV2ljxE2Ga3cN1WxTnFVv9NdNcG/zV48gYS4Pc
         hZy594uh6ZGuRNnhYUMQDeN24dt7KXnQe41Rp/lW+VLck/GlNCPjCNZXDRs1+mypTGgm
         A8UaPNlIv1bgUGnDXMatd4QcQQG41gKNaeghqRDwB78QL1N0i6Rx1C/Zw/v4XaxtT1Fo
         i+djhaJYOuR4dPfktdPxvGwgJPNC6xAj2BMVSQXV3cJAABi4ZPoA/857dEbaNgYWY4Dt
         a7eHaFpxpq82KC9hFxm3kcEJkQ6/yoWxo79Wu+u7SvTkQ+dr6lsaAYQeupsFbWtV/lsN
         7gnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=bcPVB4CzlqB28Ue8AlWpUy7elcjnmEJZl5D14wdfzG4=;
        fh=Hi51YWuPkGPl+o+QQFCkEuCgNPef+ggQN7GkeY6Y8Uo=;
        b=mtGoekwuex0gYOr1kV/N9Xw88uMyi4ubsTyIIcq0PFBOEEivnqLSSqAhEQSwT4Kpro
         jtl6lolFB5VvmyAIH6ebTDelDMNbRuxxaSNSyvnuBtCp5mNogjiAkcX3FcJSoMH42Hgb
         TDtusosNP9d+6op0NsUXZmMh5JYEL1ArJ7+rjbdBrf68/0VlUwtZOXjpKj6X+Dy0I1vw
         1MztDuUlI9YQyJxG/khLf80lheYUk9yYaOqkXLhAQYi7sp/rucVv1cH/dEWhY/5zazi6
         4y63oXgC8r70qADwlPutwvWBbh9TV1opDqEsnoIBF7MlWAXWEBuFfz3CwsM1oxAG2lbt
         fbJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785009891; x=1785614691; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bcPVB4CzlqB28Ue8AlWpUy7elcjnmEJZl5D14wdfzG4=;
        b=SoxTWwdUVy5WRwgwbzDb32goJ7GwvZl8KMZoLSYdOVWzPR/EjZkbjD/228cTidz6xw
         GSQFodHdfw3Ma/T3lkz8C2adP+mGo6zL6A4LFrWnY3ISSJUlsCOrtUBe3h7HqndGQjmC
         +hUHJaWr4fz85JXOLPncVQvD61qaxDIOiRFC5x+jtgYG5dgKYq+9ly78MauzD+DBcd+N
         gBt/rd8A0a5EbnUz+5qFJKBkxpCJ6W7bvaYIyk/FqnLei8JaPH6IFOlWo53fEd02EIvx
         hF2l/+pwHcOTfFZ7JnRw5CEcKfUAHFbR5PFAPLuGNk6VrR8QfDD0oq0XZBPS01xLPSIu
         5gIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785009891; x=1785614691;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bcPVB4CzlqB28Ue8AlWpUy7elcjnmEJZl5D14wdfzG4=;
        b=gSOZ3Pnga9AIfZTzDgN9sjObuYUzQakaaCp7yQ+u+9sFaM/jZ+Pwt1gtMtHXZydROC
         aLZ3/O8OAjQfSPCHxs4ckB9EpHWbJfScUn9rmTOVqYPKdmR7PjuRMjchx0zJrk2y91FQ
         2QaqTruBIjFtjobQQ9bkOcxAGkKDH23JlERs7FjdxxTCGoibAjMU9LlZOqxplYcYF6mK
         zmNQeDLY2GG2CaMVedCn6SU17IJrU5JHk6INubDxQzn6J4oC4N6iU5e4mtcWffZFLgiO
         vpMSR1I8CU80cDhNwd2A3QqizXpe6dwjq429HI3ICUcHQWCERxaI21uZR55YZJj2zTcb
         rbxA==
X-Gm-Message-State: AOJu0YznaGaCtjLI7OvuDIY5Yl9Gop0sSiJT8EX8fbuRI33Dpx6UWuds
	cpA+mJfnlA0I3F2VqRUAxpdv72Eb8lzdVv331gJvc86olGxVEa2czgHUKXYdUwEUjPRirs/aoUc
	KSULtaXJlD5tAXSyyv4WUg9ty4/5dmwHBkxFUhzWGnAtV
X-Gm-Gg: AR+sD11iCazDm2iA/Eb4146qV8IGAyHI72AzfrSqAeWcdyw14/nTtFHtCjAyftMxlxB
	zwOpEt/8XWKChHB0B5ZcJ6tTnmNXyD3hNrppKReVJ6lHFy0h2FFeLX7utwk130DBYor8xeerkZB
	PSiQ7h01FBFSGjF3vtSQPl+ZuwNjHrt2sZiTy+e/73jMumGgG6JlM/lGKiWqYfMdcQekiRJiPmC
	c9GkfgIdzdPjgx1RUZzV66a8MIIDqA4TtL5xRURQJV8SmQUmWqIo9/lNqkf08w8
X-Received: by 2002:a05:6a20:c90a:b0:3bf:bbad:500e with SMTP id
 adf61e73a8af0-3c67eec7d6amr2501163637.5.1785009890676; Sat, 25 Jul 2026
 13:04:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: anon <anon90372@gmail.com>
Date: Sat, 25 Jul 2026 16:04:39 -0400
X-Gm-Features: AUfX_mzvKZOGbbZrraNWU5i43yK3g5-AOT4MgL5XlH21x5MS3PraqpX2Gum3hdo
Message-ID: <CAPu26+sy2awkTJ3=abmDXzuaBBaC_LM8_QZm8kmhVBHLkmMMwQ@mail.gmail.com>
Subject: [REGRESSION] No physical display brightness control on kernel 7.1.x
To: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Device model: Google Pixelbook 2017 i7 (EVE)
OS: Fedora 44 KDE
Kernel: 7.1.4
Firmware: MrChromebox UEFI full ROM (https://docs.mrchromebox.tech/)

Hi. I'm experiencing an issue on the above system where adjusting
brightness values via the DE UI doesn't affect the physical brightness
of the display itself. The problem began following a recent system
update.

Admittedly, I haven't done the work myself to verify that this is a
kernel regression, though I believe it probable due to this forum
discussion: (https://forum.chrultrabook.com/t/2017-pixelbook-backlight-control-doesnt-work-with-7-1-kernel/8954),
the efforts of the OP in that discussion and the fact that I also own
a Kubuntu system running kernel 7.0.x without issue.
