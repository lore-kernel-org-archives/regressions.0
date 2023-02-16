Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D583CD308
	for <regressions@lists.linux.dev>; Thu, 16 Feb 2023 22:39:42 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id x31so2188849pgl.6
        for <regressions@lists.linux.dev>; Thu, 16 Feb 2023 14:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112; t=1676587182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pi9noMYVGr57MR9lsBdKAfrR3AzH/XjRZ8qVHHkboUA=;
        b=ilRc6bGW2j1NFXeJp6gWho2MZHvncBJzu3o1KNvsLnf408IY0rj98GTY1h6WayouH6
         zAgn2nxBPGOD2xowZi/VXN3bUbI20JqRaTzKfy3y5c4iKIQWhO8IeGyTJE8L6oUnFIFW
         9oAczAmKp1mk2OUmoC5dC+TF5MgmgKvbZNUFgn0o86KlPUcr2CunouQy8UkELwGt8eIb
         S6rYMtbeDDSBbKR45nmx6nU/1u7nUeBwDQlpzNVciIAcYpLadY4lENO8qdNUXE3rH6Vu
         206IgDTGJpznNkkoHas4BePgbrCGqmjfFWSt05RgNQMB02JOPpvg8YmuD/BWABva/Brz
         tp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676587182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pi9noMYVGr57MR9lsBdKAfrR3AzH/XjRZ8qVHHkboUA=;
        b=4CeSF5O9m0K3wVwog20aovFNwvIC0vkWQz8PUTJiYtP9wjgX3n2V8445VVXkKUm60z
         2qqpAn5QdHLdt21RSuGwDeuGH5vzACIfikTiiNOTLGX8KvOgaChvrNQOHV6zFBGQEImZ
         1ivxqhMveZpvlW6YnYCWRz49Of0AnXz1AB32VNSWAdm/wFZxzukJwVTRPXhnCJlAqYzS
         4D9QqI7UgKfK1dn9P0vtyUHTOJ+/CHsUa2VUIWKKG0aJyTCpefFui9NPGdUn7YIXuSHe
         mv9o+aGcr3T9lphGSkmtjhBKyZekwGVFtReT+h2tHCFXMeMRxINxLTd0qBsmv+lRIYTY
         TMZw==
X-Gm-Message-State: AO0yUKVW7CPmg9mQ3+z6EpBHnWcCWF2kkK/rRBUdgOPpprMObSY1rphJ
	rGcE0fW+TqeDszS2LGyWXXHi/WUyXeBn9Mrw7hpSACuRfncnPOLK
X-Google-Smtp-Source: AK7set9kKa9eBzDeIKikiiDIWuCL4AJkcboiiV1ZwSCTRe6TdvP3fkDrAkB5UJ/Dp6ALZBtj1NnGPoiFrl7lYrtlORM=
X-Received: by 2002:a62:cd0a:0:b0:5a9:c837:5ad5 with SMTP id
 o10-20020a62cd0a000000b005a9c8375ad5mr207866pfg.14.1676587181637; Thu, 16 Feb
 2023 14:39:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0ca02b1f-ab00-9fa6-aecc-c2c46d624e49@leemhuis.info> <e0998928-0f4e-f2a9-2e77-3e4bab459688@leemhuis.info>
In-Reply-To: <e0998928-0f4e-f2a9-2e77-3e4bab459688@leemhuis.info>
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 16 Feb 2023 17:39:30 -0500
Message-ID: <CAEzrpqc6tweHqKKPZYyVuOXH1Wd+hmrTPfcrpa-5-btU_Z24Fg@mail.gmail.com>
Subject: Re: [Regression] Bug 216961 - Severe IO scheduling starvation issues
 with btrfs
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: David Sterba <dsterba@suse.com>, Chris Mason <clm@fb.com>, 
	linux-btrfs <linux-btrfs@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Wyatt Childers <kernel.dbwta@haxing.ninja>, pmacedo@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 16, 2023 at 12:43 PM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Hi btrfs maintainers and developers.
>
> I might be missing something, but it looks like the report was ignored.
> Is there a reason for that?
>

Mostly just being blind.  I've responded to the BZ, I'll investigate
through the BZ.  Thanks,

Josef
