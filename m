Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D12741AA0
	for <regressions@lists.linux.dev>; Tue, 17 Oct 2023 11:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iCx60lpZ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-53e751aeb3cso5187588a12.2
        for <regressions@lists.linux.dev>; Tue, 17 Oct 2023 04:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697542372; x=1698147172; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oXk0KxqRZ9jejLhx8JsARQQNd5N5k9nNlrEn6GNkSNg=;
        b=iCx60lpZUzGx4ttSBLenNprYxfQpQRMSjJ2QWyETGDNTTSDt9jU5SzIxk/9GpBsin3
         5hsvTVxkmSOdv8VjE679HBFyHloQKciJq7TSWrSnDcAqBirwOzNzyIQqM4bp71hGDLVH
         SQYZ3RkSTA72Y5S6qz9rPe8i9gOi2w8xSFJbUaJImoYFZE2gB3QUYZm/NdUOW1NMZgLY
         JD+Yi9UzmRSneHQ/pXAGWac7gIxQgHcUcvB/bwNoKieNi322St4v6j4omzmd9MKIaTL2
         roqWE8vyTAVD1N85OVrg+it1Q9RjOoCKTDKMuy0SqhkXm52TYgyKlecqWiVzSGPK823x
         BN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697542372; x=1698147172;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXk0KxqRZ9jejLhx8JsARQQNd5N5k9nNlrEn6GNkSNg=;
        b=Sxh6Kms7R9JzUodFoZcJ7x+Gxb6VNTmrZBfrxZhn3FyU6QNelhzjx+XHEtDbFlNuXs
         +/88dimkV+hgPkWUXdQGoXJqakfL80SLce3HWRz3J1A44BtHtC0jc8l+Z3DEwucySHka
         QtpzHNtS93MVznhicvKQt028zvYIzxsNVEIBGBW6VcXysH/B1Jzm8+ttfhoePM8qoqmi
         MNMVRd0LjkEpW9Js2EjPFnZxYIpDW2iVzoSnJU+duvgCeGiv5apbOovr//EdTFwLnTtZ
         51pM5IwzbQO1AirfBmc4dX02ng/A0VqhiGC2hnNxvgf0eJdbuC7xbUJ3pRCvcr/8kMQ4
         geUQ==
X-Gm-Message-State: AOJu0YwXWY/vLrSBMpQfiBYHmgNeoDmWhb9qEhXwkHbqjXjZ6oCyPsZq
	5FZmS9TgYUqlFmpIn9qxAQv+pSL9Lr3Fc5ZUOUUuqQ==
X-Google-Smtp-Source: AGHT+IGauLKLYx6btp86Av5RC89JgZvmBItTh/fJtBmXX047C4V+47ymL4W2NxsepDmFTmWgVHPF3u/yQi6kKlNal4g=
X-Received: by 2002:a17:907:97d4:b0:9ae:7206:963c with SMTP id
 js20-20020a17090797d400b009ae7206963cmr1372424ejc.15.1697542371818; Tue, 17
 Oct 2023 04:32:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231017080812.117892-1-bagasdotme@gmail.com>
In-Reply-To: <20231017080812.117892-1-bagasdotme@gmail.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Tue, 17 Oct 2023 13:32:15 +0200
Message-ID: <CAMZdPi_7Psk-EF5-nA7U=Wdenq8GGszH8fUoN+LJTn9kKis41Q@mail.gmail.com>
Subject: Re: [PATCH net] Revert "net: wwan: iosm: enable runtime pm support
 for 7560"
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Networking <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Sergey Ryazanov <ryazanov.s.a@gmail.com>, 
	Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Martin <mwolf@adiumentum.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Oct 2023 at 10:08, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> Runtime power management support breaks Intel LTE modem where dmesg dump
> showes timeout errors:
>
> ```
> [   72.027442] iosm 0000:01:00.0: msg timeout
> [   72.531638] iosm 0000:01:00.0: msg timeout
> [   73.035414] iosm 0000:01:00.0: msg timeout
> [   73.540359] iosm 0000:01:00.0: msg timeout
> ```
>
> Furthermore, when shutting down with `poweroff` and modem attached, the
> system rebooted instead of powering down as expected. The modem works
> again only after power cycling.
>
> Revert runtime power management support for IOSM driver as introduced by
> commit e4f5073d53be6c ("net: wwan: iosm: enable runtime pm support for
> 7560").
>
> Fixes: e4f5073d53be ("net: wwan: iosm: enable runtime pm support for 7560")
> Reported-by: Martin <mwolf@adiumentum.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217996
> Link: https://lore.kernel.org/r/267abf02-4b60-4a2e-92cd-709e3da6f7d3@gmail.com/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>



> ---
>
>  Compile-tested only.
>
>  I explicitly do not Cc: the culprit author (M Chetan Kumar) as he can't
>  be contacted (see his MAINTAINERS entry removal [1] for why).
>
>  [1]: https://lore.kernel.org/netdev/20231013014010.18338-2-bagasdotme@gmail.com/
>
>  drivers/net/wwan/iosm/iosm_ipc_imem.c  | 17 -----------------
>  drivers/net/wwan/iosm/iosm_ipc_imem.h  |  2 --
>  drivers/net/wwan/iosm/iosm_ipc_pcie.c  |  4 +---
>  drivers/net/wwan/iosm/iosm_ipc_port.c  | 17 +----------------
>  drivers/net/wwan/iosm/iosm_ipc_trace.c |  8 --------
>  drivers/net/wwan/iosm/iosm_ipc_wwan.c  | 21 ++-------------------
>  6 files changed, 4 insertions(+), 65 deletions(-)
>
> diff --git a/drivers/net/wwan/iosm/iosm_ipc_imem.c b/drivers/net/wwan/iosm/iosm_ipc_imem.c
> index 635301d677e186..829515a601b379 100644
> --- a/drivers/net/wwan/iosm/iosm_ipc_imem.c
> +++ b/drivers/net/wwan/iosm/iosm_ipc_imem.c
> @@ -4,7 +4,6 @@
>   */
>
>  #include <linux/delay.h>
> -#include <linux/pm_runtime.h>
>
>  #include "iosm_ipc_chnl_cfg.h"
>  #include "iosm_ipc_devlink.h"
> @@ -632,11 +631,6 @@ static void ipc_imem_run_state_worker(struct work_struct *instance)
>         /* Complete all memory stores after setting bit */
>         smp_mb__after_atomic();
>
> -       if (ipc_imem->pcie->pci->device == INTEL_CP_DEVICE_7560_ID) {
> -               pm_runtime_mark_last_busy(ipc_imem->dev);
> -               pm_runtime_put_autosuspend(ipc_imem->dev);
> -       }
> -
>         return;
>
>  err_ipc_mux_deinit:
> @@ -1240,7 +1234,6 @@ void ipc_imem_cleanup(struct iosm_imem *ipc_imem)
>
>         /* forward MDM_NOT_READY to listeners */
>         ipc_uevent_send(ipc_imem->dev, UEVENT_MDM_NOT_READY);
> -       pm_runtime_get_sync(ipc_imem->dev);
>
>         hrtimer_cancel(&ipc_imem->td_alloc_timer);
>         hrtimer_cancel(&ipc_imem->tdupdate_timer);
> @@ -1426,16 +1419,6 @@ struct iosm_imem *ipc_imem_init(struct iosm_pcie *pcie, unsigned int device_id,
>
>                 set_bit(IOSM_DEVLINK_INIT, &ipc_imem->flag);
>         }
> -
> -       if (!pm_runtime_enabled(ipc_imem->dev))
> -               pm_runtime_enable(ipc_imem->dev);
> -
> -       pm_runtime_set_autosuspend_delay(ipc_imem->dev,
> -                                        IPC_MEM_AUTO_SUSPEND_DELAY_MS);
> -       pm_runtime_use_autosuspend(ipc_imem->dev);
> -       pm_runtime_allow(ipc_imem->dev);
> -       pm_runtime_mark_last_busy(ipc_imem->dev);
> -
>         return ipc_imem;
>  devlink_channel_fail:
>         ipc_devlink_deinit(ipc_imem->ipc_devlink);
> diff --git a/drivers/net/wwan/iosm/iosm_ipc_imem.h b/drivers/net/wwan/iosm/iosm_ipc_imem.h
> index 0144b45e2afb39..5664ac507c902e 100644
> --- a/drivers/net/wwan/iosm/iosm_ipc_imem.h
> +++ b/drivers/net/wwan/iosm/iosm_ipc_imem.h
> @@ -103,8 +103,6 @@ struct ipc_chnl_cfg;
>  #define FULLY_FUNCTIONAL 0
>  #define IOSM_DEVLINK_INIT 1
>
> -#define IPC_MEM_AUTO_SUSPEND_DELAY_MS 5000
> -
>  /* List of the supported UL/DL pipes. */
>  enum ipc_mem_pipes {
>         IPC_MEM_PIPE_0 = 0,
> diff --git a/drivers/net/wwan/iosm/iosm_ipc_pcie.c b/drivers/net/wwan/iosm/iosm_ipc_pcie.c
> index 3a259c9abefdfa..04517bd3325a2a 100644
> --- a/drivers/net/wwan/iosm/iosm_ipc_pcie.c
> +++ b/drivers/net/wwan/iosm/iosm_ipc_pcie.c
> @@ -6,7 +6,6 @@
>  #include <linux/acpi.h>
>  #include <linux/bitfield.h>
>  #include <linux/module.h>
> -#include <linux/pm_runtime.h>
>  #include <net/rtnetlink.h>
>
>  #include "iosm_ipc_imem.h"
> @@ -438,8 +437,7 @@ static int __maybe_unused ipc_pcie_resume_cb(struct device *dev)
>         return 0;
>  }
>
> -static DEFINE_RUNTIME_DEV_PM_OPS(iosm_ipc_pm, ipc_pcie_suspend_cb,
> -                                ipc_pcie_resume_cb, NULL);
> +static SIMPLE_DEV_PM_OPS(iosm_ipc_pm, ipc_pcie_suspend_cb, ipc_pcie_resume_cb);
>
>  static struct pci_driver iosm_ipc_driver = {
>         .name = KBUILD_MODNAME,
> diff --git a/drivers/net/wwan/iosm/iosm_ipc_port.c b/drivers/net/wwan/iosm/iosm_ipc_port.c
> index 2ba1ddca3945b2..5d5b4183e14a3a 100644
> --- a/drivers/net/wwan/iosm/iosm_ipc_port.c
> +++ b/drivers/net/wwan/iosm/iosm_ipc_port.c
> @@ -3,8 +3,6 @@
>   * Copyright (C) 2020-21 Intel Corporation.
>   */
>
> -#include <linux/pm_runtime.h>
> -
>  #include "iosm_ipc_chnl_cfg.h"
>  #include "iosm_ipc_imem_ops.h"
>  #include "iosm_ipc_port.h"
> @@ -15,16 +13,12 @@ static int ipc_port_ctrl_start(struct wwan_port *port)
>         struct iosm_cdev *ipc_port = wwan_port_get_drvdata(port);
>         int ret = 0;
>
> -       pm_runtime_get_sync(ipc_port->ipc_imem->dev);
>         ipc_port->channel = ipc_imem_sys_port_open(ipc_port->ipc_imem,
>                                                    ipc_port->chl_id,
>                                                    IPC_HP_CDEV_OPEN);
>         if (!ipc_port->channel)
>                 ret = -EIO;
>
> -       pm_runtime_mark_last_busy(ipc_port->ipc_imem->dev);
> -       pm_runtime_put_autosuspend(ipc_port->ipc_imem->dev);
> -
>         return ret;
>  }
>
> @@ -33,24 +27,15 @@ static void ipc_port_ctrl_stop(struct wwan_port *port)
>  {
>         struct iosm_cdev *ipc_port = wwan_port_get_drvdata(port);
>
> -       pm_runtime_get_sync(ipc_port->ipc_imem->dev);
>         ipc_imem_sys_port_close(ipc_port->ipc_imem, ipc_port->channel);
> -       pm_runtime_mark_last_busy(ipc_port->ipc_imem->dev);
> -       pm_runtime_put_autosuspend(ipc_port->ipc_imem->dev);
>  }
>
>  /* transfer control data to modem */
>  static int ipc_port_ctrl_tx(struct wwan_port *port, struct sk_buff *skb)
>  {
>         struct iosm_cdev *ipc_port = wwan_port_get_drvdata(port);
> -       int ret;
>
> -       pm_runtime_get_sync(ipc_port->ipc_imem->dev);
> -       ret = ipc_imem_sys_cdev_write(ipc_port, skb);
> -       pm_runtime_mark_last_busy(ipc_port->ipc_imem->dev);
> -       pm_runtime_put_autosuspend(ipc_port->ipc_imem->dev);
> -
> -       return ret;
> +       return ipc_imem_sys_cdev_write(ipc_port, skb);
>  }
>
>  static const struct wwan_port_ops ipc_wwan_ctrl_ops = {
> diff --git a/drivers/net/wwan/iosm/iosm_ipc_trace.c b/drivers/net/wwan/iosm/iosm_ipc_trace.c
> index 4368373797b69b..eeecfa3d10c5ab 100644
> --- a/drivers/net/wwan/iosm/iosm_ipc_trace.c
> +++ b/drivers/net/wwan/iosm/iosm_ipc_trace.c
> @@ -3,9 +3,7 @@
>   * Copyright (C) 2020-2021 Intel Corporation.
>   */
>
> -#include <linux/pm_runtime.h>
>  #include <linux/wwan.h>
> -
>  #include "iosm_ipc_trace.h"
>
>  /* sub buffer size and number of sub buffer */
> @@ -99,8 +97,6 @@ static ssize_t ipc_trace_ctrl_file_write(struct file *filp,
>         if (ret)
>                 return ret;
>
> -       pm_runtime_get_sync(ipc_trace->ipc_imem->dev);
> -
>         mutex_lock(&ipc_trace->trc_mutex);
>         if (val == TRACE_ENABLE && ipc_trace->mode != TRACE_ENABLE) {
>                 ipc_trace->channel = ipc_imem_sys_port_open(ipc_trace->ipc_imem,
> @@ -121,10 +117,6 @@ static ssize_t ipc_trace_ctrl_file_write(struct file *filp,
>         ret = count;
>  unlock:
>         mutex_unlock(&ipc_trace->trc_mutex);
> -
> -       pm_runtime_mark_last_busy(ipc_trace->ipc_imem->dev);
> -       pm_runtime_put_autosuspend(ipc_trace->ipc_imem->dev);
> -
>         return ret;
>  }
>
> diff --git a/drivers/net/wwan/iosm/iosm_ipc_wwan.c b/drivers/net/wwan/iosm/iosm_ipc_wwan.c
> index 93d17de08786c2..ff747fc79aaf80 100644
> --- a/drivers/net/wwan/iosm/iosm_ipc_wwan.c
> +++ b/drivers/net/wwan/iosm/iosm_ipc_wwan.c
> @@ -6,7 +6,6 @@
>  #include <linux/etherdevice.h>
>  #include <linux/if_arp.h>
>  #include <linux/if_link.h>
> -#include <linux/pm_runtime.h>
>  #include <linux/rtnetlink.h>
>  #include <linux/wwan.h>
>  #include <net/pkt_sched.h>
> @@ -52,13 +51,11 @@ static int ipc_wwan_link_open(struct net_device *netdev)
>         struct iosm_netdev_priv *priv = wwan_netdev_drvpriv(netdev);
>         struct iosm_wwan *ipc_wwan = priv->ipc_wwan;
>         int if_id = priv->if_id;
> -       int ret = 0;
>
>         if (if_id < IP_MUX_SESSION_START ||
>             if_id >= ARRAY_SIZE(ipc_wwan->sub_netlist))
>                 return -EINVAL;
>
> -       pm_runtime_get_sync(ipc_wwan->ipc_imem->dev);
>         /* get channel id */
>         priv->ch_id = ipc_imem_sys_wwan_open(ipc_wwan->ipc_imem, if_id);
>
> @@ -66,8 +63,7 @@ static int ipc_wwan_link_open(struct net_device *netdev)
>                 dev_err(ipc_wwan->dev,
>                         "cannot connect wwan0 & id %d to the IPC mem layer",
>                         if_id);
> -               ret = -ENODEV;
> -               goto err_out;
> +               return -ENODEV;
>         }
>
>         /* enable tx path, DL data may follow */
> @@ -76,11 +72,7 @@ static int ipc_wwan_link_open(struct net_device *netdev)
>         dev_dbg(ipc_wwan->dev, "Channel id %d allocated to if_id %d",
>                 priv->ch_id, priv->if_id);
>
> -err_out:
> -       pm_runtime_mark_last_busy(ipc_wwan->ipc_imem->dev);
> -       pm_runtime_put_autosuspend(ipc_wwan->ipc_imem->dev);
> -
> -       return ret;
> +       return 0;
>  }
>
>  /* Bring-down the wwan net link */
> @@ -90,12 +82,9 @@ static int ipc_wwan_link_stop(struct net_device *netdev)
>
>         netif_stop_queue(netdev);
>
> -       pm_runtime_get_sync(priv->ipc_wwan->ipc_imem->dev);
>         ipc_imem_sys_wwan_close(priv->ipc_wwan->ipc_imem, priv->if_id,
>                                 priv->ch_id);
>         priv->ch_id = -1;
> -       pm_runtime_mark_last_busy(priv->ipc_wwan->ipc_imem->dev);
> -       pm_runtime_put_autosuspend(priv->ipc_wwan->ipc_imem->dev);
>
>         return 0;
>  }
> @@ -117,7 +106,6 @@ static netdev_tx_t ipc_wwan_link_transmit(struct sk_buff *skb,
>             if_id >= ARRAY_SIZE(ipc_wwan->sub_netlist))
>                 return -EINVAL;
>
> -       pm_runtime_get(ipc_wwan->ipc_imem->dev);
>         /* Send the SKB to device for transmission */
>         ret = ipc_imem_sys_wwan_transmit(ipc_wwan->ipc_imem,
>                                          if_id, priv->ch_id, skb);
> @@ -131,14 +119,9 @@ static netdev_tx_t ipc_wwan_link_transmit(struct sk_buff *skb,
>                 ret = NETDEV_TX_BUSY;
>                 dev_err(ipc_wwan->dev, "unable to push packets");
>         } else {
> -               pm_runtime_mark_last_busy(ipc_wwan->ipc_imem->dev);
> -               pm_runtime_put_autosuspend(ipc_wwan->ipc_imem->dev);
>                 goto exit;
>         }
>
> -       pm_runtime_mark_last_busy(ipc_wwan->ipc_imem->dev);
> -       pm_runtime_put_autosuspend(ipc_wwan->ipc_imem->dev);
> -
>         return ret;
>
>  exit:
>
> base-commit: 2b10740ce74abaea31c2cad4ff8e180549c4544b
> --
> An old man doll... just what I always wanted! - Clara
>
