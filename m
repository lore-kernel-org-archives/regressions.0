Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3DE110D
	for <regressions@lists.linux.dev>; Mon, 13 Jun 2022 07:54:13 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id o33-20020a17090a0a2400b001ea806e48c6so5210612pjo.1
        for <regressions@lists.linux.dev>; Mon, 13 Jun 2022 00:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hpn8xKMupt7XEX09PSz3ZuublRBIDfWXnEUdq5eq7AQ=;
        b=jwz/9Uk3Ukruh/+3uCLAl0gN3fxTRTLdBUpi+YVjuDbuusyyV8T4wbhCc9VD5/SWKL
         sm0zDWivrhxKYz//Sr5nA7xCCh3B1MTPcaW+HstFWXokn/73hRaJweY2+O+Jm+k/pjRH
         LX60j1nsUXZyL7aHw9XFZhrjKpa/Mx4tsfgjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hpn8xKMupt7XEX09PSz3ZuublRBIDfWXnEUdq5eq7AQ=;
        b=WNL3w21dPwGktAPxN3vKC5h1BO1SQ29r611jHSmT1fm5FGnXl6/SxWDufPrV7lgYmk
         cXG5VO64MD6bEz59sVJTz/xhFg+LBg/OtSjCkkTwBJpNRVRDsJGvSc4QF6YC6fnIM/i6
         MvFPm/1IlQbSiOoQGYFBr4iVeukXWmey2O5eqg/vy+G/N/Vy2lYak8HHTxWcY4PVfAe9
         S0mhP4AQw8ILxAJWXBmimuFCYz/x75p5V1VfS9PSGUx0wy+Yhzpaj2Fl3YtrcNtEjfiP
         PaCnTha/gWlBp+yXYDg8pBFDpdFzv7DPCc4AOSfLggI9Bj+mpgMneCv/r2q2/vO3528n
         Gheg==
X-Gm-Message-State: AOAM5333USJbiZ6fMxYEn3aLmteFiaVU0hKfd9Ajp8jMEm8Z9SXY3ijz
	2MRlq762HGgH5uv8sw8c0pwebg==
X-Google-Smtp-Source: ABdhPJzw+r+KZp6HaFIa0h8yS/hJIq5Vjwc0cbEbPxqFKY3UeaK9n504TSuqOw+3dgCtnHVK0EF1Eg==
X-Received: by 2002:a17:902:dac5:b0:164:13b2:4916 with SMTP id q5-20020a170902dac500b0016413b24916mr58042646plx.32.1655106853304;
        Mon, 13 Jun 2022 00:54:13 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:de22:3777:8b31:5148])
        by smtp.gmail.com with ESMTPSA id m12-20020a17090a414c00b001ea6a20d354sm4538957pjg.2.2022.06.13.00.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 00:54:12 -0700 (PDT)
Date: Mon, 13 Jun 2022 16:54:07 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Minchan Kim <minchan@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	linux-fsdevel@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	linux-block <linux-block@vger.kernel.org>,
	regressions@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
	Nitin Gupta <ngupta@vflare.org>
Subject: Re: qemu-arm: zram: mkfs.ext4 : Unable to handle kernel NULL pointer
 dereference at virtual address 00000140
Message-ID: <YqbtH9F47dkZghJ7@google.com>
References: <CA+G9fYtVOfWWpx96fa3zzKzBPKiNu1w3FOD4j++G8MOG3Vs0EA@mail.gmail.com>
 <Yp47DODPCz0kNgE8@google.com>
 <CA+G9fYsjn0zySHU4YYNJWAgkABuJuKtHty7ELHmN-+30VYgCDA@mail.gmail.com>
 <Yp/kpPA7GdbArXDo@google.com>
 <YqAL+HeZDk5Wug28@google.com>
 <YqAMmTiwcyS3Ttla@google.com>
 <YqANP1K/6oRNCUKZ@google.com>
 <YqBRZcsfrRMZXMCC@google.com>
 <CA+G9fYvjpCOcTVdpnHTOWaf3KcDeTM3Njn_NnXvU37ppoHH5uw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvjpCOcTVdpnHTOWaf3KcDeTM3Njn_NnXvU37ppoHH5uw@mail.gmail.com>

Hello,

On (22/06/12 20:56), Naresh Kamboju wrote:
> 
> I have tested this patch and the reported issue got resolved [1].
>

Many thanks for the tests.

Quite honestly I was hoping that the patch would not help :) Well, ok,
we now know that it's mapping area lock and the lockdep part of its
memory is zero-ed out. The question is - "why?" It really should not
be zeroed out.
