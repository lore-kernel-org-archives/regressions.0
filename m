Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26FB15A9
	for <regressions@lists.linux.dev>; Wed, 13 Jul 2022 05:28:30 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id l23so17918205ejr.5
        for <regressions@lists.linux.dev>; Tue, 12 Jul 2022 22:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=zpzGC0d/rdPCgl5tFu9d6v6NpwTSdgKiF3uLQJGNpEw=;
        b=Oswchug5eEGm5u8qpEBdF6+uz0p0QanHysxN55l6VJFts/CIv+iRFyOjBkx49bbAMG
         YkmC5Qv8GATUm93DedfENfqI73R+8oL/FIugmUuE+AWw7vRyEqaVHx5RPCmwvYME3rrl
         nt7pMK886N8agX+zXKJP/woF6o03pmk7RYFt/c/bzgMOy+8I8E+yoZx68YmdOV+48blN
         VdpwBqBTr75bUJDWyzIidB1EGThrEOJyFW2WFppWuPAKCxHhAmQCIVdKDZfTTj00JBWH
         t/ReYmILLK4AkCadfyUpaNAhLq/nCgQOzVMtjDD8vY1oaQS1HEemeYj5gueduT3PU4Zu
         99tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=zpzGC0d/rdPCgl5tFu9d6v6NpwTSdgKiF3uLQJGNpEw=;
        b=Wc1sYTXCElVWl6ie7jFDGOTYICOW2XJKrW0Roe8ya0QKdvmF6WdfamW0cksjeShFbr
         P8zjgWEBMCWjj/7kih3bu1fI86GixBkBHTVi/NnZluE8ru99IcdRkRgMUX4znvqzxQ8u
         W0yvSRmQ9j9ftMm/Xp8b5fBwqq0xyngpBVYxZKyiYus91rgIZvZKJ8sZd5+1i0NCqkFp
         x0JL57RdcQrd7pNKgJVNz93tMpdew1fSZwPlS9A+9Tm2hR9Z6BUtVy9E+zroSrppiiwY
         Rtd3iZkSdlQTFUrlSC5cKRPvZ3J/bRHSf2mOzD7i7pqibsBaomfFaupBI6Ld+PKLTXZj
         YXqA==
X-Gm-Message-State: AJIora+hfT9UQNvAcUyBk6DFH5+FW7YMKo2RoxTy0Actu28hTCAbQ01g
	nYriMhkx/yFo7sPPUKkbNdrtxJMocd82bTy3fXxmOIMvi0LqUw==
X-Google-Smtp-Source: AGRyM1u0aHhUkrVGDkWSrMsK6cjXANcyLhkuDpYSD7AW4rzNr8FlYEemLqg8+PUaDySHVKhUi6JFnkr6fRnVn9u5Xvc=
X-Received: by 2002:a17:906:99c5:b0:6fe:b069:4ab6 with SMTP id
 s5-20020a17090699c500b006feb0694ab6mr1649893ejn.436.1657690108981; Tue, 12
 Jul 2022 22:28:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Ben Greening <bgreening@gmail.com>
Date: Tue, 12 Jul 2022 22:27:52 -0700
Message-ID: <CALF=6jEe5G8+r1Wo0vvz4GjNQQhdkLT5p8uCHn6ZXhg4nsOWow@mail.gmail.com>
Subject: [Regression] ACPI: video: Change how we determine if brightness
 key-presses are handled
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, rafael@kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

(resending because of HTML formatting)
Hi, I'm on Arch Linux and upgraded from kernel 5.18.9.arch1-1 to
5.18.10.arch1-1. The brightness keys don't work as well as before.
Gnome had 20 degrees of brightness, now it's 10, and Xfce went from 10
to 5. Additionally, on Gnome the brightness keys are a little slow to
respond and there's a bit of a stutter. Don't know why Xfce doesn't
stutter, but halving the degrees of brightness for both makes me
wonder if each press is being counted twice.

Reverting commit 3a0cf7ab8d in acpi_video.c and rebuilding
5.18.10.arch1-1 fixed it.
The laptop is a Dell Inspiron n4010 and I use "acpi_backlight=video"
to make the brightness keys work. Please let me know if there's any
hardware info you need.

#regzbot introduced: 3a0cf7ab8d
