Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D6E1CFA7
	for <regressions@lists.linux.dev>; Mon, 18 Sep 2023 17:09:32 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-690bfd4f3ebso32474b3a.3
        for <regressions@lists.linux.dev>; Mon, 18 Sep 2023 10:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jade-fyi.20230601.gappssmtp.com; s=20230601; t=1695056972; x=1695661772; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYQSn+OIzp01ryaAaejSH+/Rdtrl+ucwSOYu4Xut+PI=;
        b=R7ILlHgEjy5XynfIHzSs9ACz5l8M00ZhiB+a3bhradgthvRsQlbjbz68nrcu6dI2SY
         qP5oUR/lLV4tj2RmjItOELUJgOi+aiEtsNnzBlWhet8DTUF4SLWPXaYDV6tKNCNh3FFS
         L0EjSD5iMvwXGuyCQYlK6+Ha6/Wo+UOfcXMC3M5V2CXfUlt9iPNwjGEZg/fbKWY/vuGu
         SoQjO3mNaxilxmrTwMhkAAT+U0SHG71+0Ix2yKp5mUjc9vMedupMm84GiOKhgjNiP3hL
         ktgWDQEtJjSOFdEG+Kn/lhCQxyze0wFdfzUitu8gpDe0A7Gg27ahvhMmdWBz6mgBNdey
         6Jlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695056972; x=1695661772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYQSn+OIzp01ryaAaejSH+/Rdtrl+ucwSOYu4Xut+PI=;
        b=j+yB49MbqixupX5zhxOQF5a/VSH+oorJhCpmBiAmDnK4FRLHHiVoL7Wmx0BRtbbVxX
         2yhuHrOPg8739zN2m9MYLlzqlLDP6gtoj4nA8sAhhidNhZDPXAFUkEpopSFKa1wO9GKc
         hS7Dh//6IClZd1iGkKfi4hCNlp/RhqCJkcOLedVNaSxffdBgUF+ItGKMKufnFzYr8vdd
         ct6Ll2eNur/KSvC3uzyARgGqJBCxyF5lJaQqnSFMVbYZnvmZJx5Zi3IIjNYGrhdN+ML0
         hZ4uNVwlW0qeSoE6keGvDtQGOAgBFhn2BGZDQACBIpOTeGwZSbnkXCvuTdjgnm8K15ME
         is6g==
X-Gm-Message-State: AOJu0Yz9S22t1RrHBglUIay4EiAwaBqFncRrjqEvCOVnksO9CpaXEWfa
	zeeVeI59Sx7F8Gdrhe+LgwOimw==
X-Google-Smtp-Source: AGHT+IGtUIR1rYu6U73lUGcuPGDdUrU80/1dpmLzoWH5zRK9YDq6P1xbXkYrEtqDzirwAafIJfYUyg==
X-Received: by 2002:a05:6a20:7288:b0:157:e4c6:766a with SMTP id o8-20020a056a20728800b00157e4c6766amr9410730pzk.41.1695056972113;
        Mon, 18 Sep 2023 10:09:32 -0700 (PDT)
Received: from localhost ([172.103.222.8])
        by smtp.gmail.com with ESMTPSA id x14-20020a056a00270e00b0068fe7c4148fsm7330361pfv.57.2023.09.18.10.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 10:09:31 -0700 (PDT)
From: Jade Lovelace <lists@jade.fyi>
To: Gene <lists@sapience.com>,
	Ricky WU <ricky_wu@realtek.com>,
	Keith Busch <kbusch@kernel.org>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	linux-kernel@vger.kernel.org
Cc: regressions@lists.linux.dev,
	Alyssa Ross <hi@alyssa.is>,
	Michal Suchanek <msuchanek@suse.de>,
	"axboe @ kernel . dk " <axboe@kernel.dk>,
	"sagi @ grimberg . me " <sagi@grimberg.me>,
	"linux-nvme @ lists . infradead . org " <linux-nvme@lists.infradead.org>,
	"hch@lst.de" <hch@lst.de>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org
Subject: [Revert] Re: Possible nvme regression in 6.4.11
Date: Mon, 18 Sep 2023 10:07:38 -0700
Message-ID: <20230918170831.1677690-2-lists@jade.fyi>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <66bc5229-8131-4111-96fe-bd5ee90314b0@leemhuis.info>
References: <66bc5229-8131-4111-96fe-bd5ee90314b0@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This regression affects all copies of the Dell XPS 15 9560 and Dell Precision
5520 with any SSD including aftermarket ones.

Per the bugzilla discussion here:
https://bugzilla.kernel.org/show_bug.cgi?id=217802 this regression has
been confirmed to also affect 6.5.2 and 6.6-rc1, and affects several
distros.

Known affected branches: 6.1, 6.4, 6.5, 6.6.

It has already been reverted by OpenSUSE and is soon to be reverted in
NixOS. A patch follows, hopefully with the right metadata tags.

I have compiled a kernel 6.1 with the revert and confirmed it now boots
again.

p.s. this is my first time pointing git-send-email at this particular
list, so I'm sorry if I got anything wrong.

Jade


