Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB9114294
	for <regressions@lists.linux.dev>; Thu, 18 Apr 2024 04:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713416296; cv=none; b=St9V4vLMwlC/fW0d3lzpLz+n8pSacTtquK5h1NQoCji3e9zlWuOnakejc+ROhr/k6psFbeWU+VfI76JCiP+FPeyEsVr5WqK1QGEqQ2OWiFbfttD7Kv75ToihwqJyHv/qYwQf8gCyKF4bMiWY2d4mnckUOhZDWn3d6dsTaQotAgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713416296; c=relaxed/simple;
	bh=1GIfnLR14SpISzBtJDNhW/puZNUl+1Lzin0dxK/lgws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYx+62IoSDYIb8Jiuw+zkokWRRnLUWPY5T9CvuRXPQ4ilSH9cATWAGc24xxOQpIU28ZcCRV7Gx3blZnJAUrxSIjHMNQCpjVNqgR8MFAyPoRR9bTuVzqtmxliAxWVpr+rsJ3dCI8lJEQLsvmMuO9NDn4rLG9wqnq5BRlJF5V8XrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V0EHP+XQ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V0EHP+XQ"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56e1f3462caso527055a12.3
        for <regressions@lists.linux.dev>; Wed, 17 Apr 2024 21:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713416293; x=1714021093; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SL2uiIXH35aGZc0Hh8VLlfK7Ln3jRKiQNAg1SPvfYcs=;
        b=V0EHP+XQ8Ik637I9rKcKHs9gres+4HnBW1KPyupfKYNcK0XWegmBq42jQxY/UxJkzQ
         MGmHz0qVQdp3h2ayyJSQnPm4Qamn6p7ucVkv89ueikL5AdewiEWXmdrkvvfrsNhxa0p8
         Y3qjIArax4EyIkjW6lpjh82NvKInXDp0EZnkBp35iSR6XisW4ZPqZTJgkOHzzneBwCE3
         9k0oIyZ2SXNyNXnLe22BW6z5o+sfox+zd8OHsNLeHbJYqwJ6Za7dyAgs4NfBr6/4iQq3
         VS82Ogq/rIsFe02Leq/y0lnit3p0A2MIvu/0oc7Ubd2DMx86tJOTrYg+KigzMCRm13KS
         3qwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713416293; x=1714021093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SL2uiIXH35aGZc0Hh8VLlfK7Ln3jRKiQNAg1SPvfYcs=;
        b=BqHMzIDAFZiYinL8wXxDfQgWMh6q1VHdr5elBPXwXJ9OB1hcIhcJaatwcY7rSQ+7ld
         kDTaHJMs2Uai9kVSS7hsrSSNrG/w3yB1jMirbiYXHyhYFHhpPihntN19X/A6Uby+Py0J
         MMskWadjhg8nb1rZDzb6XG2NDmvhRKwTqb7WwPWcLXHxn7OnOzL/aSNrVne4xlY/UGAN
         7j+xAqP8NiEctLh5EiIJ/7r4boScKpdovdxcfKiJP24Jpuo3dBj76onJT3ExYMODEeFX
         zdB7ZfGkhcjmHFFoOqjC+Hz2i9067gq3XHqZNd9syFSzf8RF92j20FCopT1ijc5nVq9c
         wlpQ==
X-Gm-Message-State: AOJu0YyLOxB2/T2FTNd8qPXQHiTZ5o/LfUP1dNrQCpkRfup8sRojz6Cg
	tbvr0/TLkkFtpQFtl5ERDr/sCDMpya7fQvBMvsvJLktbSKau4f/d
X-Google-Smtp-Source: AGHT+IHz0IE74OUzjcYa9ALlwnqFMHsbPsP49is02/FUiFH1TdkJ3Fu4Hl774aOUHaxTCJ5ZuqG6xA==
X-Received: by 2002:a50:d4c2:0:b0:56e:2abd:d00f with SMTP id e2-20020a50d4c2000000b0056e2abdd00fmr1172402edj.18.1713416292503;
        Wed, 17 Apr 2024 21:58:12 -0700 (PDT)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id d15-20020aa7d68f000000b005701df2ea98sm383140edr.32.2024.04.17.21.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 21:58:11 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 1C0A9BE2EE8; Thu, 18 Apr 2024 06:58:10 +0200 (CEST)
Date: Thu, 18 Apr 2024 06:58:10 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Paulo Alcantara <pc@manguebit.com>
Cc: regressions@lists.linux.dev, Steve French <stfrench@microsoft.com>,
	gregkh@linuxfoundation.org, sashal@kernel.org,
	stable@vger.kernel.org, linux-cifs@vger.kernel.org
Subject: Re: [regression 6.1.80+] "CIFS: VFS: directory entry name would
 overflow frame end of buf" and invisible files under certain conditions and
 at least with noserverino mount option
Message-ID: <ZiCoYjr79HXxiTjr@eldamar.lan>
References: <ZiBCsoc0yf_I8In8@eldamar.lan>
 <cc3eea56282f4b43d0fe151a9390c512@manguebit.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc3eea56282f4b43d0fe151a9390c512@manguebit.com>

Hi Paulo,

Thanks a lot for your time on looking into it.

On Wed, Apr 17, 2024 at 07:58:56PM -0300, Paulo Alcantara wrote:
> Hi Salvatore,
> 
> Salvatore Bonaccorso <carnil@debian.org> writes:
> 
> > In Debian we got two reports of cifs mounts not functioning, hiding
> > certain files. The two reports are:
> >
> > https://bugs.debian.org/1069102
> > https://bugs.debian.org/1069092
> >
> > On those cases kernel logs error
> >
> > [   23.225952] CIFS: VFS: directory entry name would overflow frame end of buf 00000000a44b272c
> 
> I couldn't reproduce it.  Does the following fix your issue:
> 
> diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
> index 4c1231496a72..3ee35430595e 100644
> --- a/fs/smb/client/smb2pdu.c
> +++ b/fs/smb/client/smb2pdu.c
> @@ -5083,7 +5083,7 @@ smb2_parse_query_directory(struct cifs_tcon *tcon,
>  		info_buf_size = sizeof(struct smb2_posix_info);
>  		break;
>  	case SMB_FIND_FILE_FULL_DIRECTORY_INFO:
> -		info_buf_size = sizeof(FILE_FULL_DIRECTORY_INFO);
> +		info_buf_size = sizeof(FILE_FULL_DIRECTORY_INFO) - 1;
>  		break;
>  	default:
>  		cifs_tcon_dbg(VFS, "info level %u isn't supported\n",
> 
> If not, please provide network trace and verbose logs.

Yes that appears to fix the issue.

But as you say you are not able to reproduce the issue, I guess we
need to try to get it clearly reproducible first to see we face no
other fallouts?

Regards,
Salvatore
