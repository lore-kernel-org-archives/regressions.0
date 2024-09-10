Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36FC46444
	for <regressions@lists.linux.dev>; Tue, 10 Sep 2024 09:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725960217; cv=none; b=gMBKgdaIp3Zzdwzs8D8yt2b4cVzX7kZOYY0MJH90IXHvmHGoRVta4pCWyhnIQ2FcIC2qdluwckW8iu4FccmYBVb5g3mbBaeYHqwms7zKWu9PgJX1WTj8i/lTNTPzJUc3xH7bbUdG5Ygxt7oCXF1mVBxegpKMhdtBEpNk0JGFRqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725960217; c=relaxed/simple;
	bh=RHKfWvlyDATplkCyalLpaVoYdWyYE4JsNzmkEjE+L0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJGgHtbbK/S+EgwUpEThXOFkIm49g9dKez0zftnaNvmV2/JAtsbowcAgGtXkgDEdALthFQ197iin3o2eLRKh5fsKpkzW+ZpbO66SgkgOlEytPL/UX1u3s226IrWhZC9DmJ2m9V6QwFxyI7UawamGPxIhOIS1IPLpBsPUy/x7nnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dxsCayq7; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dxsCayq7"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e1a989bd17aso5598808276.1
        for <regressions@lists.linux.dev>; Tue, 10 Sep 2024 02:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725960215; x=1726565015; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RHKfWvlyDATplkCyalLpaVoYdWyYE4JsNzmkEjE+L0s=;
        b=dxsCayq7N/JgZ3sUYLg4pdeOq+SqhZM2R5g+Ljhho/KlEbdvz1KpjXLS57t4ZGPksQ
         MLjbaMwgMhlGG1ipfQqRHgP33zOjqKdidk3zJmtYa0R6CuV67EBSZ7oEcAZUYlgbI2N1
         RDLSfQNkWkIqbrVxn3jnGgHBVyYq2NB3oXiWv+lEvb6bAr0NpdIjWs7NrLjI7Hgl3/mb
         vogFVNymLUi9pCsJAigXBxbO3WGYE//7fnwcWCzOX/NbUcF3Dsm4vyXOE8l80oNSut6o
         jJ7PkNN33jTtHizldEpOk1ojidYrYLAuwY9tGat7cXIAEk+9nHNeHOCnzVtkDisod2/9
         ySGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725960215; x=1726565015;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RHKfWvlyDATplkCyalLpaVoYdWyYE4JsNzmkEjE+L0s=;
        b=j0ZyQQCViKqJ21OCfuwQmzweRm7Zi8pWj5CkAtPDx7tf5OgKp2TysnC0JoET0R4U/k
         tVzvYujlWX3bdbzCQTIdk8fdMXVjSjXXZuXaV2VVssVUtCU6Y/nKFlSZeIK9x5Ty+UH/
         zsi6xnS4IVys2uuAJTPg3bX4DjD2HGdBR6meIg31sYbsEJGGZGzijepn9XBBF9nM2BgR
         x9OshqYIKthou5iCPouu/dTfjvDo4O5VRQwyzNqShL793zcsaLix2N9xFDtkP2HIzroR
         HbU4F1spGElQn2gyXds/1S2ZxImZ9iFzEJJoCPdNhgbVvkdj2IZ/IqRQuI7PCM0Rms4Y
         5d+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcnS0uU87qZ56j0+5GR8Q+WfngfMTWoh6ZDVyvlwOKJLyWM6qigVgNlhvuxKn4ocqxyrIShLtWPb8qyA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCUc1tNejPDjKJQsTHrw8roW9dxzpX5dUnGZo2812M24k519j2
	BQpIl9Bbf29qD1Wc/zqB+0DmQzjQrl+1F8sfPMZUKh4OY/ZdhxeNCsAmEr3OdLg8qzYC32vqpHe
	1COj0jGCXDYVVfP3WUwvrXaWagUA=
X-Google-Smtp-Source: AGHT+IFa61QRgfsiOf9BDA5CrcYUn1VdOL7jl6IcZS0vPsKkLHHtnQKOh4PPaSk6RPhOu5rvr7HTs/mJnSuELrHplxE=
X-Received: by 2002:a05:6902:230d:b0:e1a:90f4:c1f6 with SMTP id
 3f1490d57ef6-e1d34899313mr14831493276.27.1725960214744; Tue, 10 Sep 2024
 02:23:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAP-bSRbMbZe9LCE15SCbYNTGZjE_xiAm29qzO_WNVjHsJ6oyyg@mail.gmail.com>
 <9ada34661b93fa5dfe3b0c66816a62c1a27f22a3.camel@intel.com> <CAP-bSRZm4CyxY1VdtWvZRcfLMwc3njd3OTSd446Q5dcSfjJY=Q@mail.gmail.com>
In-Reply-To: <CAP-bSRZm4CyxY1VdtWvZRcfLMwc3njd3OTSd446Q5dcSfjJY=Q@mail.gmail.com>
From: Chris Bainbridge <chris.bainbridge@gmail.com>
Date: Tue, 10 Sep 2024 10:23:23 +0100
Message-ID: <CAP-bSRbon4O=DCLHvOZHm452Svc3-gsZ133Jn7-TFt8f_Y1CFA@mail.gmail.com>
Subject: Re: [REGRESSION] iwlwifi resume error, bisected
To: "Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kvalo@kernel.org" <kvalo@kernel.org>, 
	"Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>, 
	"Berg, Johannes" <johannes.berg@intel.com>, 
	"benjamin@sipsolutions.net" <benjamin@sipsolutions.net>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sat, 7 Sept 2024 at 22:21, Chris Bainbridge
<chris.bainbridge@gmail.com> wrote:
>
> It's possible that the
> HP BIOS turns off the wifi when suspended on battery power

This is not the case. Suspending while on battery power and then
resuming (still on battery power) works without error.

If the laptop is docked, and powered via both the dock USB-C *and* a
mains PSU on the separate PSU connector, then suspended, then either
the dock or the PSU are disconnected, then the error happens on
resume, even though the laptop is continuously mains powered via the
other power supply. It appears there's something about a powered
dock/PSU unplug event while suspended that causes the error, as
opposed to just being suspended while running on battery.
